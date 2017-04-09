//
//  CookbookAPIService.swift
//  Cookbook
//
//  Created by Dominik Vesely on 12/01/2017.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import Foundation
import Alamofire
import ReactiveSwift
import Result

protocol CookbookAPIServicing {
    func getRecipes() -> SignalProducer<[Receipt],RequestError>
    func getRecipe(id: String) -> SignalProducer<Receipt, RequestError>
    func rateRecipe(id: String, score: Int) -> SignalProducer<Void, RequestError>
    func createRecipe(name: String, description: String, info: String, duration: Int, ingredients: [String]) -> SignalProducer<Receipt, RequestError>
}

/**
 Concrete class for creating api calls to our server
 */
class CookbookAPIService : APIService, CookbookAPIServicing {
    
    override func resourceURL(_ path: String) -> URL {
        let URL = Foundation.URL(string: "https://cookbook.ack.ee/api/v1/")!
        let relativeURL = Foundation.URL(string: path, relativeTo: URL)!
        return relativeURL
    }
    
    func getRecipes() -> SignalProducer<[Receipt], RequestError> {
        return self.request("recipes")
            .mapError { .network($0) }
            .attemptMap { response in
                guard let items = response as? [Any] else { return Result.failure(RequestError.mapping()) }
                do { return Result.success(try [Receipt].decode(items)) }
                catch { return Result.failure(RequestError.mapping()) }
            }
    }

    func getRecipe(id: String) -> SignalProducer<Receipt, RequestError> {
        return self.request("recipes/\(id)")
            .mapError { .network($0) }
            .attemptMap { response in
                guard let item = response else { return Result.failure(RequestError.mapping()) }
                do { return Result.success(try Receipt.decodeValue(item)) }
                catch { return Result.failure(RequestError.mapping()) }
        }
    }

    func rateRecipe(id: String, score: Int) -> SignalProducer<Void, RequestError> {
        return self.request("recipes/\(id)/ratings", method: .post, parameters: ["score": score], encoding: JSONEncoding.default)
            .mapError { .network($0) }
            .map { _ in }
    }

    func createRecipe(name: String, description: String, info: String, duration: Int, ingredients: [String]) -> SignalProducer<Receipt, RequestError> {
        return self.request("recipes", method: .post, parameters: ["name": name, "description": description, "info": info, "duration": duration, "ingredients": ingredients], encoding: JSONEncoding.default)
            .mapError { .network($0) }
            .attemptMap { response in
                guard let item = response else { return Result.failure(RequestError.mapping()) }
                do { return Result.success(try Receipt.decodeValue(item)) }
                catch { return Result.failure(RequestError.mapping()) }
        }
    }
}

//
//  BaseViewModel.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 10.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import Foundation

class BaseViewModel {
    func handleError(_ error: Error) -> String {
        if let error = error as? RequestError {
            switch error {
            case .mapping():
                return "Oops, bad response".localized()
            case .network(let e):
                // Better to exact this code to separate class:
                if let data = e.data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                        if let message = (json as? NSDictionary ?? [:])["message"] as? String {
                            return message
                        }
                    }
                    catch {}
                }
                return "Oops, something went wrong. Please try again later!".localized()
            }
        }
        else {
            return error.localizedDescription
        }
    }
}

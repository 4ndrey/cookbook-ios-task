//
//  Receipt.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 08.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import Himotoki

struct Receipt: ReceiptViewModeling, Decodable {
    let id: String
    let name: String
    let duration: Int
    let score: Float

    let description: String?
    let ingredients: [String]?
    let info: String?

    // MARK: Decodable

    static func decode(_ e: Extractor) throws -> Receipt {
        return try Receipt(
            id: e <| "id",
            name: e <| "name",
            duration: e <| "duration",
            score: e <| "score",

            description: e <|? "description",
            ingredients: e <||? "ingredients",
            info: e <|? "info"
        )
    }
}

extension Receipt {
    static func with(_ model: ReceiptViewModeling) -> Receipt {
        return Receipt(id: model.id, name: model.name, duration: model.duration, score: model.score, description: model.description, ingredients: model.ingredients, info: model.info)
    }

    func updateScore(_ score: Float) -> Receipt {
        return Receipt(id: id, name: name, duration: duration, score: score, description: description, ingredients: ingredients, info: info)
    }
}

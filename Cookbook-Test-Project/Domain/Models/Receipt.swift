//
//  Receipt.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 08.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import Himotoki

struct Receipt: Decodable {
    let id: String
    let name: String
    let duration: Int
    let score: Int

    // MARK: Decodable

    static func decode(_ e: Extractor) throws -> Receipt {
        return try Receipt(
            id: e <| "id",
            name: e <| "name",
            duration: e <| "duration",
            score: e <| "score"
        )
    }
}

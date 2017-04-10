//
//  Score.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 10.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import Himotoki

struct Score: Decodable {
    let id: String
    let score: Float

    // MARK: Decodable

    static func decode(_ e: Extractor) throws -> Score {
        return try Score(
            id: e <| "id",
            score: e <| "score"
        )
    }
}


//
//  ReceiptViewModeling.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 10.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

protocol ReceiptViewModeling {
    var id: String { get }
    var name: String { get }
    var duration: Int { get }
    var score: Float { get }

    var description: String? { get }
    var ingredients: [String]? { get }
    var info: String? { get }
}

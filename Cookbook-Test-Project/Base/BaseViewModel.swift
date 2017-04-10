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
        if error is RequestError {
            // Should be better error handling with parsing error message JSON, but leaving it so for simplicity
            return "Oops, something went wrong! Please fill all fields or try again later"
        }
        else {
            return error.localizedDescription
        }
    }
}

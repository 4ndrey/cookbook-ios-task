//
//  ListController.swift
//  Cookbook-Test-Project
//
//  Created by Dominik Vesely on 12/01/2017.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit

class ListController: BaseViewController {

    var objects = [Any]()

    var api: CookbookAPIServicing!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        //Just quick snippet for showing how to work with api service
        self.api = CookbookAPIService(network: Network(), authHandler: nil)
        api.getRecipes().startWithResult { (result) in
            if case .success(let value) = result {
                print (value ?? "")
            }
            
            if case .failure(let error) = result {
                print(error)
            }
        }
        
    }
}


//
//  BaseViewController.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 08.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    func back() {
        navigationController?.popViewController(animated: true)
    }
}

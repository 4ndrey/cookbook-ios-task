//
//  BaseViewController.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 08.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        setupUI()
    }

    func setupUI() {

    }

    func push(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }

    func back() {
        navigationController?.popViewController(animated: true)
    }

    func displayErrorMessage(_ message: String?) {
        if message != nil {
            let alert = UIAlertController(title: "Error".localized(), message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK".localized(), style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}

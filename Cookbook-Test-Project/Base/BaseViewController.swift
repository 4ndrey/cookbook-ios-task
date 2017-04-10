//
//  BaseViewController.swift
//  Cookbook
//
//  Created by Andrey Toropchin on 08.04.17.
//  Copyright © 2017 Dominik Vesely. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    var keyboardHeight = CGFloat(0)

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupUI()
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil, queue: OperationQueue.main) { [weak self] notification in
            self?.handleKeyboardAppearance(notification)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
    }

    func setupUI() {
        // to be overriden
    }

    private func handleKeyboardAppearance(_ notification: Notification) {
        if let frame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if frame.origin.y < UIScreen.main.bounds.height {
                keyboardHeight = min(CGFloat(frame.size.width), CGFloat(frame.size.height))
            } else {
                keyboardHeight = 0
            }
        }
        keyboardWillChangeFrame(notification)
    }

    func keyboardWillChangeFrame(_ notification: Notification)
    {
        var scrollView: UIScrollView!
        for view in self.view.subviews {
            if view is UIScrollView {
                scrollView = view as! UIScrollView
            }
        }

        if scrollView != nil {
            let contentInsets: UIEdgeInsets
            if keyboardHeight > 0 {
                contentInsets = UIEdgeInsetsMake(0, 0, keyboardHeight, 0)
            } else {
                contentInsets = UIEdgeInsets.zero
                keyboardHeight = 0
            }
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        }
    }
}

// MARK: - Navigation

extension BaseViewController {
    func push(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }

    func back() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Error displaying

extension BaseViewController {
    func displayErrorMessage(_ message: String?) {
        if message != nil {
            let alert = UIAlertController(title: "Error".localized(), message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK".localized(), style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}

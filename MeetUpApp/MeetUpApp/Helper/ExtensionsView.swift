//
//  ExtensionsView.swift
//  MeetUpApp
//
//  Created by Vũ Linh on 18/07/2021.
//

import UIKit

extension UIViewController {
    // Set ViewController is child
    func setUpTabLayout(viewControllerLeft: UIViewController,
                        viewControllerRight: UIViewController,
                        leftViewInput: UIView,
                        rightViewInput: UIView) {
        addChild(viewControllerLeft)
        leftViewInput.addSubview(viewControllerLeft.view)
        viewControllerLeft.view.frame = leftViewInput.bounds
        viewControllerLeft.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewControllerLeft.didMove(toParent: self)
        
        addChild(viewControllerRight)
        rightViewInput.addSubview(viewControllerRight.view)
        viewControllerRight.view.frame = rightViewInput.bounds
        viewControllerRight.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewControllerRight.didMove(toParent: self)
    }
    
    func alertError(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Localized.ok, style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

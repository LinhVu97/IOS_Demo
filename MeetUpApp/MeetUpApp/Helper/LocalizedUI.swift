//
//  LocalizedUI.swift
//  MeetUpApp
//
//  Created by Vũ Linh on 15/07/2021.
//

import UIKit

extension UILabel {
    @IBInspectable var localizeText: String {
        set(value) {
            self.text = NSLocalizedString(value, comment: "")
        }
        get {
            return ""
        }
    }
}

extension UIButton {
    @IBInspectable var localizeTitle: String {
        set(value) {
            self.setTitle(NSLocalizedString(value, comment: ""), for: .normal)
        }
        get {
            return ""
        }
    }
}

//
//  UIEmojiTextField.swift
//  Goals
//
//  Created by Abanoub Ashraf on 01/12/2023.
//

import UIKit

final class UIEmojiTextField: UITextField {
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setEmoji() {
        _ = self.textInputMode
    }
    
    override var textInputContextIdentifier: String? {
        return ""
    }
    
    override var textInputMode: UITextInputMode? {
        for mode in UITextInputMode.activeInputModes {
            if mode.primaryLanguage == "emoji" {
                self.keyboardType = .default
                return mode
            }
        }
        
        return nil
    }
}

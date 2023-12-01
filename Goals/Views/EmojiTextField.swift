//
//  EmojiTextField.swift
//  Goals
//
//  Created by Abanoub Ashraf on 01/12/2023.
//

import SwiftUI

struct EmojiTextField: UIViewRepresentable {
    typealias UIViewType = UIEmojiTextField
    
    @Binding var text: String
    
    var placeholder: String = ""
    
    func makeUIView(context: Context) -> UIEmojiTextField {
        let textField = UIEmojiTextField()
        textField.placeholder = self.placeholder
        textField.text = self.text
        textField.delegate = context.coordinator
        return textField
    }
    
    func updateUIView(_ uiView: UIEmojiTextField, context: Context) {
        uiView.text = self.text
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
}

class Coordinator: NSObject, UITextFieldDelegate {
    var parent: EmojiTextField
    
    init(parent: EmojiTextField) {
        self.parent = parent
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        DispatchQueue.main.async { [weak self] in
            self?.parent.text = textField.text ?? ""
        }
    }
}

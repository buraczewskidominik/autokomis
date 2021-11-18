//
//  KeyboardPresentableViewController.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 10/08/2021.
//

import UIKit

class KeyboardPresentableViewController: UIViewController {
    
    /// List of all text fields on the screen.
    var presentedTextFields: [UITextField]? {
        didSet {
            presentedTextFields?.forEach { $0.delegate = self }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
        super.viewWillDisappear(animated)
    }
    
    @objc private func keyboardWillChange(notification: Notification) {
        guard let keyboardRect = (notification.userInfo?[UIWindow.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        if notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification {
            if let firstResponderTextField = presentedTextFields?.first(where: { $0.isFirstResponder } ) {
                if firstResponderTextField.frame.maxY > keyboardRect.origin.y {
                    let difference = firstResponderTextField.frame.maxY - keyboardRect.origin.y
                    view.frame.origin.y -= difference
                }
            }
        } else {
            view.frame.origin.y = 0
        }
    }
}

extension KeyboardPresentableViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let presentedTextFields = presentedTextFields?.compactMap({ $0 }) else { return true }
        if presentedTextFields.last != textField,
           let currentTextFieldIndex = presentedTextFields.firstIndex(of: textField) {
            presentedTextFields[currentTextFieldIndex + 1].becomeFirstResponder()
        }
        presentedTextFields.first(where: { $0 == textField } )?.resignFirstResponder()
        return true
    }
}

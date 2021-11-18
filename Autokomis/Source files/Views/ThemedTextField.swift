//
//  ThemedTextField.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 08/08/2021.
//

import UIKit

final class ThemedTextField: UITextField {

    struct Style {
        static let defaultStyle = Style(
            insets: UIEdgeInsets(top: .zero, left: 12, bottom: .zero, right: 12),
            backgroundColor: .white,
            textColor: .black,
            placeholderAttrubutes: [.foregroundColor: UIColor.lightGray],
            cornerRadius: 4,
            borderWidth: 2,
            borderColor: UIColor.gray.cgColor
        )
        
        let insets: UIEdgeInsets
        let backgroundColor: UIColor
        let textColor: UIColor
        let placeholderAttrubutes: [NSAttributedString.Key: Any]?
        let cornerRadius: CGFloat
        let borderWidth: CGFloat
        let borderColor: CGColor
    }
    
    // MARK: Properties
    
    /// Current input value.
    var value: String? {
        self.text
    }
    
    /// Provides access to String from input on fly.
    var onValueChange: ((String?) -> Void)?
    
    // MARK: Private properties
    
    private var insets: UIEdgeInsets

    /// Initialize button with a given style.
    init(style: ThemedTextField.Style = .defaultStyle, placeholder: String = "") {
        insets = style.insets
        super.init(frame: .zero)
        setup(with: style, placeholder: placeholder)
        setConstraint()
    }
    
    @available(*, unavailable, message: "Use init(style:) instead")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(with style: ThemedTextField.Style, placeholder: String) {
        backgroundColor = style.backgroundColor
        textColor = style.textColor
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: style.placeholderAttrubutes)
        layer.cornerRadius = style.cornerRadius
        layer.borderWidth = style.borderWidth
        layer.borderColor = style.borderColor
        addTarget(self, action: #selector(textFieldValueChanged), for: .editingChanged)
    }
    
    private func setConstraint() {
        self.addConstraints { [
            $0.equalConstant(.height, 40)
        ] }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: insets)
    }
    
    // MARK: Action
    
    @objc private func textFieldValueChanged(sender: UITextField) {
        onValueChange?(sender.text)
    }
}

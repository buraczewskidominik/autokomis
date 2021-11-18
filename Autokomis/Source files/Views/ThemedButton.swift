//
//  ThemedButton.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 08/08/2021.
//

import UIKit

final class ThemedButton: UIButton {

    struct Style {
        static let defaultStyle = Style(
            backgroundColor: .white,
            titleColor: .black,
            cornerRadius: 0,
            borderWidth: 0,
            borderColor: UIColor.white.withAlphaComponent(1).cgColor
        )
        static let signUp = Style(
            backgroundColor: .app(.custom(color: .mainDarkRed)),
            titleColor: .white,
            cornerRadius: 4,
            borderWidth: 0,
            borderColor: UIColor.white.withAlphaComponent(1).cgColor
        )
        static let logIn = Style(
            backgroundColor: .app(.custom(color: .mainBlue)),
            titleColor: .white,
            cornerRadius: 4,
            borderWidth: 0,
            borderColor: UIColor.white.withAlphaComponent(1).cgColor
        )
        static let continueBuying = Style(
            backgroundColor: .white,
            titleColor: .black,
            cornerRadius: 4,
            borderWidth: 2,
            borderColor: UIColor.app(.custom(color: .mainBlue)).cgColor
        )
        
        let backgroundColor: UIColor
        let titleColor: UIColor
        let cornerRadius: CGFloat
        let borderWidth: CGFloat
        let borderColor: CGColor
    }
    
    /// Initialize button with a given style.
    init(style: ThemedButton.Style = .defaultStyle) {
        super.init(frame: .zero)
        setup(with: style)
        setUpConstraint()
    }
    
    @available(*, unavailable, message: "Use init(style:) instead")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(with style: ThemedButton.Style) {
        backgroundColor = style.backgroundColor
        setTitleColor(style.titleColor, for: .normal)
        layer.cornerRadius = style.cornerRadius
        layer.borderWidth = style.borderWidth
        layer.borderColor = style.borderColor
    }
    
    private func setUpConstraint() {
        self.addConstraints { [
            $0.equalConstant(.height, 44)
        ] }
    }
}

//
//  StarView.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 15/08/2021.
//

import UIKit

final class StarView: UIView {

    // MARK: UI
    
    private lazy var starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .app(.quality)
        imageView.image = UIImage(systemName: isStarFilled ? "star.fill" : "star")
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = title
        return label
    }()
    
    // MARK: Private properties
    
    private let isStarFilled: Bool
    private let title: String
    
    init(
        isStarFilled: Bool,
        title: String
    ) {
        self.isStarFilled = isStarFilled
        self.title = title
        
        super.init(frame: .zero)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        addSubviews(starImageView, titleLabel)
        
        starImageView.addConstraints { [
            $0.equal(.top),
            $0.equal(.bottom),
            $0.equal(.leading, constant: Margins.medium),
            $0.equalConstant(.height, 40),
            $0.equalConstant(.width, 40)
        ] }
        
        titleLabel.addConstraints { [
            $0.equalTo(starImageView, .centerY, .centerY),
            $0.equal(.trailing, constant: -Margins.medium)
        ] }
    }
}

//
//  CarImageCollectionViewCell.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 15/08/2021.
//

import UIKit

final class CarImageCollectionViewCell: UICollectionViewCell {
    
    // MARK: Identifier
    
    static let identifier = "CarImageCollectionViewCell"
    
    // MARK: UI
    
    private lazy var carImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        carImageView.image = nil
    }
    
    ///
    func setCarImage(url: URL?) {
        carImageView.setImage(withURL: url)
    }
    
    private func setUpUI() {
        contentView.addSubviews(carImageView)
        
        carImageView.addConstraints {
            $0.equalEdges()
        }
    }
}

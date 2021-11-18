//
//  CarCell.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 08/08/2021.
//

import UIKit

final class CarCell: UITableViewCell {
    
    // MARK: Properties
    
    static let identifier = "CarCell"
    
    var viewModel: CarCellViewModel!
    
    // MARK: Private properties
    
    private lazy var carImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var carTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var carPriceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var carMilageLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var carYearLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var carPetrolTypeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        carImageView.image = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
    
    private func setUpUI() {
        contentView.addSubviews(
            carImageView,
            carTitleLabel,
            carPriceLabel,
            carMilageLabel,
            carYearLabel,
            carPetrolTypeLabel
        )
        
        carImageView.addConstraints { [
            $0.equal(.top),
            $0.equal(.leading),
            $0.equal(.trailing),
            $0.equalConstant(.height, 200)
        ] }
        
        carTitleLabel.addConstraints { [
            $0.equalTo(carImageView, .top, .bottom, constant: Margins.tiny),
            $0.equal(.leading),
            $0.equal(.trailing)
        ] }
        
        carPriceLabel.addConstraints { [
            $0.equalTo(carTitleLabel, .top, .bottom, constant: Margins.tiny),
            $0.equal(.leading),
            $0.equal(.trailing)
        ] }
        
        carMilageLabel.addConstraints { [
            $0.equalTo(carPriceLabel, .top, .bottom, constant: Margins.tiny),
            $0.equal(.leading),
            $0.equal(.bottom, constant: -Margins.tiny)
        ] }
        
        carYearLabel.addConstraints { [
            $0.equalTo(carMilageLabel, .centerY, .centerY),
            $0.equalTo(carMilageLabel, .leading, .trailing, constant: Margins.medium)
        ] }
        
        carPetrolTypeLabel.addConstraints { [
            $0.equalTo(carMilageLabel, .centerY, .centerY),
            $0.equalTo(carYearLabel, .leading, .trailing, constant: Margins.medium),
            $0.equal(.trailing)
        ] }
    }
    
    func setUpContent() {
        carImageView.setImage(withURL: viewModel.frontImage())
        carTitleLabel.text = viewModel.carFullName()
        carPriceLabel.text = viewModel.carPrice()
        carMilageLabel.text = viewModel.carMilage()
        carYearLabel.text = viewModel.carYear()
        carPetrolTypeLabel.text = viewModel.petrolType()
    }
}

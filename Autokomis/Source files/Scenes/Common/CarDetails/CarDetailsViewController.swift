//
//  CarDetailsViewController.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 13/08/2021.
//

import UIKit

protocol CarDetailsViewControllerDelegate: AnyObject {
    
//    func didClickOn(imageIndex: Int, images: [URL?]) // TODO: open new window to show images. Redirect user to the chosen image.
}

final class CarDetailsViewController: ScrollableViewController {
    
    // MARK: Properties
    
    var viewModel: CarDetailsViewModel!
    
    weak var delegate: CarDetailsViewControllerDelegate?
    
    // MARK: Private properties
    
    private static let collectionViewHeight: CGFloat = 200
    
    // MARK: Sections
    
    enum Section {
        case main
    }
    
    // MARK: Datasource
    
    private lazy var dataSource = UICollectionViewDiffableDataSource<Section, URL?>(collectionView: carImagesCollectionView) { [weak self] collectionView, indexPath, imageUrl in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarImageCollectionViewCell.identifier, for: indexPath) as? CarImageCollectionViewCell
        cell?.setCarImage(url: imageUrl)
        return cell
    }
    
     // MARK: UI
    
    private lazy var carImagesCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            CarImageCollectionViewCell.self,
            forCellWithReuseIdentifier: CarImageCollectionViewCell.identifier
        )
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var carTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        return label
    }()
    
    private lazy var carPriceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var specificationTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Localizable.Common.CarDetails.specification
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        return label
    }()
    
    private lazy var carQualityView: CarQualityView = {
        CarQualityView(
            notDamaged: viewModel.carIsNotDamaged(),
            hadNoAccidents: viewModel.carIsAccidentFree(),
            hasPlates: viewModel.carHasPlates()
        )
    }()
    
    private lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Localizable.Common.CarDetails.description
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setContent()
        carImagesCollectionView.dataSource = dataSource
        applySnapshot(for: viewModel.getImages())
    }
    
    private func setUpUI() {
        scrollableView.addSubviews(
            carImagesCollectionView,
            carTitleLabel,
            carPriceLabel,
            carQualityView,
            specificationTitleLabel,
            descriptionTitleLabel,
            descriptionLabel
        )
        
        carImagesCollectionView.addConstraints { [
            $0.equal(.top),
            $0.equal(.leading),
            $0.equal(.trailing),
            $0.equalConstant(.height, CarDetailsViewController.collectionViewHeight)
        ] }
        
        carTitleLabel.addConstraints { [
            $0.equalTo(carImagesCollectionView, .top, .bottom, constant: Margins.tiny),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium)
        ] }
        
        carPriceLabel.addConstraints { [
            $0.equalTo(carTitleLabel, .top, .bottom, constant: Margins.tiny),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium)
        ] }
        
        carQualityView.addConstraints { [
            $0.equalTo(carPriceLabel, .top, .bottom, constant: Margins.tiny),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium)
        ] }
        
        specificationTitleLabel.addConstraints { [
            $0.equalTo(carQualityView, .top, .bottom, constant: Margins.tiny),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium)
        ] }
        
        descriptionTitleLabel.addConstraints { [
            $0.equalTo(specificationTitleLabel, .top, .bottom, constant: Margins.tiny),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium)
        ] }
        
        descriptionLabel.addConstraints { [
            $0.equalTo(descriptionTitleLabel, .top, .bottom, constant: Margins.tiny),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium),
            $0.equal(.bottom, constant: -Margins.medium)
        ] }
    }
    
    private func setContent() {
        carTitleLabel.text = ""
    }
    
    private func applySnapshot(for carImages: [URL?], animated: Bool = false) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, URL?>()
        snapshot.appendSections([.main])
        snapshot.appendItems(carImages)
        dataSource.apply(snapshot, animatingDifferences: animated, completion: nil)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout -

extension CarDetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width, height: CarDetailsViewController.collectionViewHeight)
    }
}

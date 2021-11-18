//
//  SellerProfileViewController.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 16/08/2021.
//

import UIKit

protocol SellerProfileViewControllerDelegate: AnyObject {
    
    func didClickEditProfile()
}

final class SellerProfileViewController: UIViewController {
    
    // MARK: Properties
    
    weak var delegate: SellerProfileViewControllerDelegate?
    
    var viewModel: SellerProfileViewModel!
    
    // MARK: Private properties
    
    private lazy var editProfileBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(
            title: Localizable.SellerProfile.editProfile,
            style: .plain,
            target: self,
            action: #selector(editProfile)
        )
        return barButtonItem
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        view.backgroundColor = .white
        
        setUpNavigationBar()
    }
    
    private func setUpNavigationBar() {
        navigationItem.backButtonTitle = Localizable.EditSellerProfile.back
        navigationItem.rightBarButtonItems = [editProfileBarButtonItem]
    }
    
    @objc private func editProfile() {
        delegate?.didClickEditProfile()
    }
}

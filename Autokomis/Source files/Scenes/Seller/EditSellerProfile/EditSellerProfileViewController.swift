//
//  EditSellerProfileViewController.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 16/08/2021.
//

import UIKit

protocol EditSellerProfileViewControllerDelegate: AnyObject {
    
    func didClickDone()
}

final class EditSellerProfileViewController: UIViewController {
    
    // MARK: Properties
    
    weak var delegate: EditSellerProfileViewControllerDelegate?
    
    var viewModel: EditSellerProfileViewModel!
    
    // MARK: Private properties
    
    private lazy var finishEditingProfileBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(
            title: Localizable.EditSellerProfile.save,
            style: .plain,
            target: self,
            action: #selector(finishEditing)
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
        navigationItem.rightBarButtonItems = [finishEditingProfileBarButtonItem]
    }
    
    @objc private func finishEditing() {
        delegate?.didClickDone()
    }
}

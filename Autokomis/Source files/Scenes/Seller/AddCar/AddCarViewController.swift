//
//  AddCarViewController.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 16/08/2021.
//

import UIKit

protocol AddCarViewControllerDelegate: AnyObject {
    
    func didAddCar(_ car: Car)
}

final class AddCarViewController: UIViewController {

    // MARK: Properties
    
    weak var delegate: AddCarViewControllerDelegate?
    
    var viewModel: AddCarViewModel!
    
    // MARK: Private properties
    
    private lazy var addCarBarButtonItem: UIBarButtonItem = {
        let image = UIImage(systemName: "plus")
        let barButtonItem = UIBarButtonItem(
            image: image,
            style: .plain,
            target: self,
            action: #selector(addCar)
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
        navigationItem.rightBarButtonItems = [addCarBarButtonItem]
    }
    
    @objc private func addCar() {
        addCarAction()
    }
    
    private func addCarAction() {
        viewModel.addCar()
    }
}

//
//  EditCarViewController.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 16/08/2021.
//

import UIKit

protocol EditCarViewControllerDelegate: AnyObject {
    
    func didSaveChanges()
}

final class EditCarViewController: UIViewController {
    
    // MARK: Properties
    
    weak var delegate: EditCarViewControllerDelegate?
    
    var viewModel: EditCarViewModel!
    
    // MARK: Private properties
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        
    }
}

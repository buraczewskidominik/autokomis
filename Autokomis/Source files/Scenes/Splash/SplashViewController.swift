//
//  SplashViewController.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 07/08/2021.
//

import UIKit
import Combine

final class SplashViewController: UIViewController {
    
    // MARK: Properties
    
    weak var delegate: SplashViewControllerDelegate?

    // MARK: UI
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = Localizable.Splash.title
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        splash()
    }
    
    private func setUpUI() {
        view.backgroundColor = .white
        view.addSubviews(titleLabel)
        
        titleLabel.addConstraints { [
            $0.equal(.centerX),
            $0.equal(.centerY)
        ] }
    }
    
    private func splash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [unowned self] in
            self.delegate?.splashDidComplete(self)
        }
    }
}

// MARK: Delegate

/// A protocol which can be implemented to receive calls when splash screen completed.
protocol SplashViewControllerDelegate: AnyObject {
    
    /// Called when splash screen completed.
    ///
    /// - Parameter splashViewController: The splash view controllet.
    func splashDidComplete(_ splashViewController: SplashViewController)
}

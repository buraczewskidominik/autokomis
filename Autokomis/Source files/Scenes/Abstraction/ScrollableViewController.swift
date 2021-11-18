//
//  ScrollableViewController.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 15/08/2021.
//

import UIKit

class ScrollableViewController: UIViewController {
    
    // MARK: UI
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    /// View which provides scolling feature.
    lazy var scrollableView: UIView = {
        let view = UIView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        
        scrollView.addConstraints {
            $0.equalEdges()
        }
        
        scrollView.addSubview(scrollableView)
        
        scrollableView.addConstraints { [
            $0.equal(.top),
            $0.equal(.bottom),
            $0.equalTo(view, .leading, .leading),
            $0.equalTo(view, .trailing, .trailing)
        ] }
    }
}

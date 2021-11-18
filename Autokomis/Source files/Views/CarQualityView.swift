//
//  CarQualityView.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 15/08/2021.
//

import UIKit

final class CarQualityView: UIView {
    
    // MARK: Private properties
    
    private let notDamaged: Bool
    private let hadNoAccidents: Bool
    private let hasPlates: Bool
    
    // MARK: UI
    
    private lazy var notDamagedStarView: StarView = {
        let starView = StarView(
            isStarFilled: notDamaged,
            title: Localizable.Common.CarDetails.notDamagedNow
        )
        return starView
    }()
    
    private lazy var hadNoAccidentsStarView: StarView = {
        let starView = StarView(
            isStarFilled: hadNoAccidents,
            title: Localizable.Common.CarDetails.noAccidents
        )
        return starView
    }()
    
    private lazy var hasPlatesStarView: StarView = {
        let starView = StarView(
            isStarFilled: hasPlates,
            title: Localizable.Common.CarDetails.hasPlates
        )
        return starView
    }()

    init(
        notDamaged: Bool,
        hadNoAccidents: Bool,
        hasPlates: Bool
    ) {
        self.notDamaged = notDamaged
        self.hadNoAccidents = hadNoAccidents
        self.hasPlates = hasPlates
        
        super.init(frame: .zero)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        addSubviews(
            notDamagedStarView,
            hadNoAccidentsStarView,
            hasPlatesStarView
        )
        
        notDamagedStarView.addConstraints { [
            $0.equal(.top),
            $0.equal(.leading),
            $0.equal(.trailing)
        ] }
        
        hadNoAccidentsStarView.addConstraints { [
            $0.equalTo(notDamagedStarView, .top, .bottom, constant: Margins.tiny),
            $0.equal(.leading),
            $0.equal(.trailing)
        ] }
        
        hasPlatesStarView.addConstraints { [
            $0.equalTo(hadNoAccidentsStarView, .top, .bottom, constant: Margins.tiny),
            $0.equal(.leading),
            $0.equal(.trailing),
            $0.equal(.bottom)
        ] }
    }
}

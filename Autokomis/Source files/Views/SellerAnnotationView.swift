//
//  SellerAnnotationView.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 12/08/2021.
//

import MapKit

final class SellerAnnotationView: NSObject, IdentifiableAnnotation {
    
    var id: String
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var viewIdentifier = "Seller"
    
    init(
        id: String,
        coordinate: CLLocationCoordinate2D,
        title: String?
    ) {
        self.id = id
        self.coordinate = coordinate
        self.title = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  IdentifiableAnnotation.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 12/08/2021.
//

import MapKit

protocol IdentifiableAnnotation: MKAnnotation {
    var id: String { get }
    var viewIdentifier: String { get }
}

//
//  SellersLocationsViewController.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 07/08/2021.
//

import UIKit
import MapKit

final class SellersLocationsViewController: UIViewController {
    
    // MARK: Properties
    
    weak var delegate: SellersLocationsViewControllerDelegate?
    
    var viewModel: SellersLocationsViewModel!
    
    // MARK: UI
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.delegate = self
        mapView.showsUserLocation = true
        return mapView
    }()
    
    private lazy var newSessionBarButtonItem: UIBarButtonItem = {
        let image = UIImage(systemName: "house")
        let barButtonItem = UIBarButtonItem(
            image: image,
            style: .plain,
            target: self,
            action: #selector(newSession)
        )
        return barButtonItem
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setMapCenter()
    }
    
    private func setUpUI() {
        view.backgroundColor = .black
        
        view.addSubviews(mapView)
        
        mapView.addConstraints {
            $0.equalEdges()
        }
        
        setUpNavigationBar()
    }
    
    private func setUpNavigationBar() {
        navigationItem.leftBarButtonItems = [newSessionBarButtonItem]
    }
    
    // MARK: Actions
    
    @objc private func newSession() {
        delegate?.startNewSession()
    }
    
    private func setMapCenter() {
        viewModel.getUserLocation { [weak self] location, error in
            guard let location = location,
                  error == nil else {
                self?.delegate?.showError(error)
                return
            }
            let mapCamera = MKMapCamera(
                lookingAtCenter: location,
                fromEyeCoordinate: location,
                eyeAltitude: 25000
            )
            self?.mapView.setCamera(mapCamera, animated: true)
            self?.getSellers(forLocation: location)
        }
    }
    
    private func getSellers(forLocation location: CLLocationCoordinate2D) {
        viewModel.getSellers(forLocation: location) { [weak self] sellers, error in
            guard error == nil else {
                self?.delegate?.showError(error)
                return
            }
            // save sellers
            
        }
    }
    
    private func setMapAnnotationsWithSellers(_ sellers: [User]) {
        let annotations = sellers.map { seller -> SellerAnnotationView in
            SellerAnnotationView(
                id: seller.id,
                coordinate: CLLocationCoordinate2D(
                    latitude: seller.latitude,
                    longitude: seller.longitude
                ),
                title: seller.businessName
            )
        }
        mapView.addAnnotations(annotations)
    }
    
    private func chooseSeller(withId id: String) {
        guard let seller = viewModel.getSeller(withId: id) else { return }
        delegate?.didChooseSeller(seller)
    }
    
}

protocol SellersLocationsViewControllerDelegate: AnyObject {
    
    func showError(_ error: Error?)
    
    func didChooseSeller(_ seller: User)
    
    func startNewSession()
}

// MARK: - MKMapViewDelegate -

extension SellersLocationsViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView: MKMarkerAnnotationView
        
        let identifier: String
        if let annotation = annotation as? IdentifiableAnnotation {
            identifier = annotation.viewIdentifier
        } else {
            identifier = "Default"
        }
        
        if let dequedView = mapView.dequeueReusableAnnotationView(
            withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            annotationView = dequedView
        } else{
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let identifiableAnnotation = view.annotation as? IdentifiableAnnotation else { return }
        chooseSeller(withId: identifiableAnnotation.id)
    }
}

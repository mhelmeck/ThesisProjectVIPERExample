//
//  ShowMapViewController.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 24/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

import MapKit
import UIKit

public class ShowMapViewController: UIViewController {
    // MARK: - Public properties
    public var presentation: ShowMapPresentation!
    public var eventHandler: ShowMapEventHandler!
    
    // MARK: - Private properties
    @IBOutlet private weak var mapView: MKMapView!
    private var annotationView = MKPointAnnotation()
    
    // MARK: - Init
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        eventHandler.handleViewDidAppear()
    }
}

extension ShowMapViewController: ShowMapView {
    public func setLocation(latitude: Double, longitude: Double) {
        let center = CLLocationCoordinate2D(latitude: latitude,
                                            longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)
        let region = MKCoordinateRegion(center: center, span: span)

        mapView.setRegion(region, animated: true)
    }
    
    public func setupAnnotation(latitude: Double, longitude: Double) {
        annotationView.coordinate = CLLocationCoordinate2D(latitude: latitude,
                                                           longitude: longitude)

        mapView.addAnnotation(annotationView)
    }
}

//
//  ShowMapPresenterIO.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 24/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public protocol ShowMapPresentation: class {}

public protocol ShowMapView: class {
    func setLocation(latitude: Double, longitude: Double)
    func setupAnnotation(latitude: Double, longitude: Double)
}

public protocol ShowMapEventHandler: class {
    func handleViewReady()
    func handleViewDidAppear()
}

public protocol ShowMapNavigation: class {}

//
//  MapPresenterIO.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 24/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public protocol MapPresentation: class {}

public protocol MapView: class {}

public protocol MapEventHandler: class {
    func handleViewReady()
    func handleViewDidAppear()
}

public protocol MapNavigation: class {}

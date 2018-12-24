//
//  CityDetailsPresenterIO.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 24/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public protocol CityDetailsPresentation: class {}

public protocol CityDetailsView: class {}

public protocol CityDetailsEventHandler: class {
    func handleViewReady()
    func handleViewDidAppear()
}

public protocol CityDetailsNavigation: class {}

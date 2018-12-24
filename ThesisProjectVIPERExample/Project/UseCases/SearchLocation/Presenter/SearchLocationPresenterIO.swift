//
//  SearchLocationPresenterIO.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 25/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public protocol SearchLocationPresentation: class {}

public protocol SearchLocationView: class {}

public protocol SearchLocationEventHandler: class {
    func handleViewReady()
    func handleViewDidAppear()
}

public protocol SearchLocationNavigation: class {}

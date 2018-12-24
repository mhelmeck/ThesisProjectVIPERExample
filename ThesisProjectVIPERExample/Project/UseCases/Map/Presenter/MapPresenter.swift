//
//  MapPresenter.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 24/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public class MapPresenter {
    // MARK: - Public properties
    public weak var view: MapView!
    public var interactor: MapUseCase!
    public var router: MapNavigation!
    
    // MARK: - Init
    public init() {}
}

extension MapPresenter: MapPresentation {}

extension MapPresenter: MapEventHandler {
    public func handleViewReady() {}

    public func handleViewDidAppear() {}
}

extension MapPresenter: MapUseCaseOutput {}

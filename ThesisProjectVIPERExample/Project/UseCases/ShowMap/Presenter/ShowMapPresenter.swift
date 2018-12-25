//
//  ShowMapPresenter.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 24/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public class ShowMapPresenter {
    // MARK: - Public properties
    public weak var view: ShowMapView!
    public var interactor: ShowMapUseCase!
    public var router: ShowMapNavigation!
    
    // MARK: - Public properties
    private let row: Int
    
    // MARK: - Init
    public init(row: Int) {
        self.row = row
    }
}

extension ShowMapPresenter: ShowMapPresentation {}

extension ShowMapPresenter: ShowMapEventHandler {
    public func handleViewReady() {}

    public func handleViewDidAppear() {
        let city = interactor.getCities()[row]
        let latitude = city.coordinates.lat
        let longitude = city.coordinates.lon
        
        view.setLocation(latitude: latitude, longitude: longitude)
        view.setupAnnotation(latitude: latitude, longitude: longitude)
    }
}

extension ShowMapPresenter: ShowMapUseCaseOutput {}

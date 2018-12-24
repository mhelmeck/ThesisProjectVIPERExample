//
//  CityDetailsPresenter.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 24/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public class CityDetailsPresenter {
    // MARK: - Public properties
    public weak var view: CityDetailsView!
    public var interactor: CityDetailsUseCase!
    public var router: CityDetailsNavigation!
    
    // MARK: - Init
    public init() {}
}

extension CityDetailsPresenter: CityDetailsPresentation {}

extension CityDetailsPresenter: CityDetailsEventHandler {
    public func handleViewReady() {}
    
    public func handleViewDidAppear() {}
}

extension CityDetailsPresenter: CityDetailsUseCaseOutput {}

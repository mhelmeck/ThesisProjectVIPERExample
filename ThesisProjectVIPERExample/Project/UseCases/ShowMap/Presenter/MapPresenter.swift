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
    
    // MARK: - Init
    public init() {}
}

extension ShowMapPresenter: ShowMapPresentation {}

extension ShowMapPresenter: ShowMapEventHandler {
    public func handleViewReady() {}

    public func handleViewDidAppear() {}
}

extension ShowMapPresenter: ShowMapUseCaseOutput {}

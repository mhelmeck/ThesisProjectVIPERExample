//
//  AppBuilder.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 23/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

import UIKit

public class AppBuilder {
    // MARK: - Private properties
    private let repository: AppRepositoryType
    private let apiManager: APIManagerType
    
    // MARK: - Init
    public init(repository: AppRepositoryType,
                apiManager: APIManagerType) {
        self.repository = repository
        self.apiManager = apiManager
    }
}

extension AppBuilder: CitiesListBuilder {
    public func buildCitiesList() -> UIViewController {
        let interactor = CitiesListInteractor()
        let presenter = CitiesListPresenter()
        let router = CitiesListRouter()
        let viewController = CitiesListViewController()
        
        router.builder = self
        router.viewController = viewController

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.output = presenter
        interactor.apiManager = apiManager
        interactor.dataManager = repository

        viewController.presentation = presenter
        viewController.eventHandler = presenter
        
        return viewController
    }
}

extension AppBuilder: ShowMapBuilder {
    public func buildShowMap() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(
            withIdentifier: "ShowMap") as? ShowMapViewController else {
            fatalError("Could not instantiate initial storyboard with name: ShowMap")
        }
        
        let interactor = ShowMapInteractor()
        let presenter = ShowMapPresenter(row: 0)
        let router = ShowMapRouter()
        
        router.builder = self
        router.viewController = viewController
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        interactor.apiManager = apiManager
        interactor.dataManager = repository
        
        viewController.presentation = presenter
        viewController.eventHandler = presenter
        
        return viewController
    }
}

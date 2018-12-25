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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(
            withIdentifier: "CitiesList") as? CitiesListViewController else {
                fatalError("Could not instantiate initial storyboard with name: ShowMap")
        }
        
        let interactor = CitiesListInteractor()
        let presenter = CitiesListPresenter()
        let router = CitiesListRouter()
        
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
    public func buildShowMap(forRow row: Int) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(
            withIdentifier: "ShowMap") as? ShowMapViewController else {
            fatalError("Could not instantiate initial storyboard with name: ShowMap")
        }
        
        let interactor = ShowMapInteractor()
        let presenter = ShowMapPresenter(row: row)
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

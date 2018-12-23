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

extension AppBuilder: MainTableBuilder {
    public func buildMainTable() -> UIViewController {
        let interactor = MainTableInteractor()
        let presenter = MainTablePresenter()
        let router = MainTableRouter()
        let viewController = MainTableViewController()
        
        router.builder = self
        router.viewController = viewController
        interactor.dataManager = repository
    
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = viewController

        interactor.output = presenter
        
        viewController.eventHandler = presenter
        viewController.presenter = presenter
        
        return viewController
    }
}

extension AppBuilder: MapBuilder {
    public func buildMap() -> UIViewController {
        return UIViewController()
    }
}

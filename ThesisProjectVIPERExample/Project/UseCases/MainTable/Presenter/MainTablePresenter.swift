//
//  MainTablePresenter.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 23/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public class MainTablePresenter {
    // MARK: - Properties
    public weak var view: MainTableView!
    public var interactor: MainTableUseCase!
    public var router: MainTableNavigation!
    
    // MARK: - Init
    public init() {}
}

extension MainTablePresenter: MainTableUseCaseOutput {
    public func dataDidFetch() {
        view.reloadView()
        view.setSeparatorStyle(.singleLine)
        view.isLoading(false)
    }
}

extension MainTablePresenter: MainTableViewPresentation {
    public func getNumberOfCells() -> Int {
        return interactor.getCities().count
    }
    
    public func configureCell(atRow row: Int, configure: (String, String, String) -> Void) {
        let city = interactor.getCities()[row]
        
        let cityName = city.name
        let temperature = [String(Int(city.brief.currentTemperature)), "°C"].joined(separator: " ")
        let iconName = AssetCodeMapper.map(city.brief.asset)
        
        configure(cityName, temperature, iconName)
    }
}

public class CellConfiguration {
    
}
extension MainTablePresenter: MainTableEventHandler {
    public func handleViewReady() {
        // first init
        view.isLoading(true)
        interactor.fetchInitialData()
    }
    
    public func handleViewDidAppear() {
        interactor.reloadData()
        view.reloadView()
    }
    
    public func handleCellPressed(atRow: Int) {
        router.navigateToDetails()
    }
    
    public func handleNaviagationPressed(atRow: Int) {
        router.navigateToMap()
    }
}

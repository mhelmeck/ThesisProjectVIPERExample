//
//  CitiesListPresenter.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 23/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public class CitiesListPresenter {
    // MARK: - Public properties
    public weak var view: CitiesListView!
    public var interactor: CitiesListUseCase!
    public var router: CitiesListNavigation!
    
    // MARK: - Init
    public init() {}
}

extension CitiesListPresenter: CitiesListPresentation {
    public func getNumberOfCells() -> Int {
        return interactor.getCities().count
    }
    
    public func configureCell(atRow row: Int, configure: (CitiesListCellViewModel) -> Void) {
        let city = interactor.getCities()[row]
        
        let cityName = city.name
        let temperature = [String(Int(city.brief.currentTemperature)), "°C"].joined(separator: " ")
        let iconName = AssetCodeMapper.map(city.brief.asset)
        let cellViewModel = CitiesListCellViewModel(cityName: cityName,
                                                    temperature: temperature,
                                                    iconName: iconName)
        
        configure(cellViewModel)
    }
}

extension CitiesListPresenter: CitiesListEventHandler {
    public func handleViewReady() {
        view.isLoading(true)
        interactor.fetchInitialData()
    }
    
    public func handleViewDidAppear() {
        view.reloadView()
    }
    
    public func handleCellPressed(atRow row: Int) {
        router.navigateToCityDetails(atRow: row)
    }
    
    public func handleNaviagationPressed(atRow row: Int) {
        router.navigateToMap(atRow: row)
    }
    
    public func handleAddPressed() {
        router.navigateToSearchLocation()
    }
}

extension CitiesListPresenter: CitiesListUseCaseOutput {
    public func didFetchData() {
        view.reloadView()
        view.setSeparatorStyle(.singleLine)
        view.isLoading(false)
    }
}

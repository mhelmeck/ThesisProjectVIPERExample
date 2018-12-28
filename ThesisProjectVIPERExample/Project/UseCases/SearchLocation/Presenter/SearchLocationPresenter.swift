//
//  SearchLocationPresenter.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 25/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public class SearchLocationPresenter {
    // MARK: - Public properties
    public weak var view: SearchLocationView!
    public var interactor: SearchLocationUseCase!
    public var router: SearchLocationNavigation!
    
    // MARK: - Private properties
    private var currentCoordinates: Coordinates?
    
    // MARK: - Init
    public init() {}
}

extension SearchLocationPresenter: SearchLocationPresentation {
    public func getNumberOfCells() -> Int {
        return interactor.getLocations().count
    }
    
    public func configureCell(atRow row: Int, configure: (LocationCellViewModel) -> Void) {
        let location = interactor.getLocations()[row]
        let cellViewModel = LocationCellViewModel(cityName: location.name)
        
        configure(cellViewModel)
    }
}

extension SearchLocationPresenter: SearchLocationEventHandler {
    public func handleViewReady() {}
    
    public func handleViewDidAppear() {
        interactor.clearData()
    }
    
    public func handleCellPressed(atRow row: Int) {
        view.setLoadingState(isLoading: true)
        let location = interactor.getLocations()[row]
        let code = location.code
        
        interactor.fetchCity(withCode: code)
    }
    
    public func handleLocationDidChange(latitude: Double, longitude: Double) {
        let coordinates = Coordinates(latitude: latitude,
                                      longitude: longitude)
        
        interactor.fetchCurrentLocation(forCoordinates: coordinates)
    }
    
    public func handleSearch(phrase: String) {
        interactor.fetchLocations(withQuery: phrase)
    }
    
    public func handleSearchCurrent() {
        guard let currentCoordinates = currentCoordinates else {
            return
        }
        
        interactor.fetchLocations(forCoordinates: currentCoordinates)
    }
    
    public func handleCancel() {
        router.navigateToList()
        
        interactor.clearData()
    }
}

extension SearchLocationPresenter: SearchLocationUseCaseOutput {
    public func didFetchCurrentLocation(location: Location) {
        let labelText = "Your current location is: \(location.name)"
        
        currentCoordinates = location.coordinates
        view.setCurrentLocationLabel(labelText)
        view.enableCurrentButton()
    }
    
    public func didFetchLocations() {
        view.reloadView()
    }
    
    public func didFetchCity() {
        interactor.clearData()
        view.setLoadingState(isLoading: false)
        router.navigateToList()
    }
}

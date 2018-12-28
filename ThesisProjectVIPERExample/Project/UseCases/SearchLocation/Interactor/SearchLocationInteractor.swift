//
//  SearchLocationInteractor.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 25/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public class SearchLocationInteractor {
    // MARK: - Public properties
    public weak var output: SearchLocationUseCaseOutput!
    public var apiManager: SearchLocationEntityGateway!
    public var dataManager: SearchLocationDataGateway!
    
    // MARK: - Init
    public init() {}
}

extension SearchLocationInteractor: SearchLocationUseCase {
    public func fetchCurrentLocation(forCoordinates coordinates: Coordinates) {
        let latitude = String(coordinates.latitude)
        let longitude = String(coordinates.longitude)
        apiManager.fetchParents(withCoordinate: latitude, longitude) { [weak self] in
            guard let self = self,
                  let currentParent = $0.first else {
                return
            }
            
            let adapter = LocationAdapter(apiParent: currentParent)
            let currentLocation = adapter.toLocation()
            
            self.output.didFetchCurrentLocation(location: currentLocation)
        }
    }
    
    public func fetchLocations(withQuery query: String) {
        apiManager.fetchParents(withQuery: query) {[weak self] in
            guard let self = self else {
                return
            }
            
            self.fetchLocations(from: $0)
        }
    }
    
    public func fetchLocations(forCoordinates coordinates: Coordinates) {
        let latitude = String(coordinates.latitude)
        let longitude = String(coordinates.longitude)
        apiManager.fetchParents(withCoordinate: latitude, longitude) { [weak self] in
            guard let self = self else {
                return
            }

            self.fetchLocations(from: $0)
        }
    }
    
    public func fetchCity(withCode code: String) {
        apiManager.fetchForecast(forCode: code) { [weak self] in
            guard let self = self else {
                return
            }
            
            let adapter = CityAdapter(apiForecast: $0)
            let city = adapter.toCity()
            
            self.dataManager.addCity(city: city)
            self.output.didFetchCity()
        }
    }
    
    public func getLocations() -> [Location] {
        return dataManager.getLocations()
    }
    
    public func clearData() {
        dataManager.clearLocations()
    }
    
    private func fetchLocations(from parents: [APIParent]) {
        let adapter = LocationCollectionAdapter(apiParentCollection: parents)
        let locationCollection = adapter.toLocationCollection()
        
        self.updateRepository(withData: locationCollection)
        self.output.didFetchLocations()
    }
    
    private func updateRepository(withData data: [Location]) {
        clearData()
        data.forEach {
            dataManager.addLocation(location: $0)
        }
    }
}

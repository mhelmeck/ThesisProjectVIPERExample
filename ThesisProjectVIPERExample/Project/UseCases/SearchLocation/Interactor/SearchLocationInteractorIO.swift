//
//  SearchLocationInteractorIO.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 25/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public protocol SearchLocationUseCase: class {
    func fetchLocations(withQuery query: String)
    func fetchLocations(forCoordinates coordinates: Coordinates)
    func fetchCurrentLocation(forCoordinates coordinates: Coordinates)
    func fetchCity(withCode code: String)
    
    func getLocations() -> [Location]
    func clearData()
}

public protocol SearchLocationUseCaseOutput: class {
    func didFetchLocations()
    func didFetchCity()
    func didFetchCurrentLocation(location: Location)
}

public typealias SearchLocationEntityGateway = APIManagerType

public typealias SearchLocationDataGateway = AppRepositoryType

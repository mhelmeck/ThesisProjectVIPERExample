//
//  CitiesListInteractorIO.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 23/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public protocol CitiesListUseCase: class {
    func fetchInitialData()
    func getCities() -> [City]
}

public protocol CitiesListUseCaseOutput: class {
    func didFetchData()
}

public typealias CitiesListEntityGateway = APIForecastProvider

public typealias CitiesListDataGateway = CityPersistence

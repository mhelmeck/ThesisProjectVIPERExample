//
//  MainTableInteractorIO.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 23/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public protocol MainTableUseCase: class {
    func fetchInitialData()
    func reloadData()
    func getCities() -> [City]
}

public protocol MainTableUseCaseOutput: class {
    func dataDidFetch()
}

public typealias MainTableEntityGateway = APIForecastProvider

public typealias MainTableDataGateway = CityPersistence

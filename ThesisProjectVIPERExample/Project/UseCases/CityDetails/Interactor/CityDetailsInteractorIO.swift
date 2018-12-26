//
//  CityDetailsInteractorIO.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 24/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public protocol CityDetailsUseCase: class {
    func getCities() -> [City]
}

public protocol CityDetailsUseCaseOutput: class {}

public typealias CityDetailsEntityGateway = APIForecastProvider

public typealias CityDetailsDataGateway = CityPersistence

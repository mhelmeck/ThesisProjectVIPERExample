//
//  MapInteractorIO.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 24/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public protocol MapUseCase: class {}

public protocol MapUseCaseOutput: class {}

public typealias MapEntityGateway = APIForecastProvider

public typealias MapDataGateway = CityPersistence

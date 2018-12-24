//
//  SearchLocationInteractorIO.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 25/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public protocol SearchLocationUseCase: class {}

public protocol SearchLocationUseCaseOutput: class {}

public typealias SearchLocationEntityGateway = APIForecastProvider

public typealias SearchLocationDataGateway = CityPersistence

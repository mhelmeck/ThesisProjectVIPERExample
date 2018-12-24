//
//  ShowMapInteractorIO.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 24/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public protocol ShowMapUseCase: class {}

public protocol ShowMapUseCaseOutput: class {}

public typealias ShowMapEntityGateway = APIForecastProvider

public typealias ShowMapDataGateway = CityPersistence

//
//  CityDetailsInteractor.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 24/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public class CityDetailsInteractor {
    // MARK: - Public properties
    public weak var output: CityDetailsUseCaseOutput!
    public var apiManager: CityDetailsEntityGateway!
    public var dataManager: CityDetailsDataGateway!
    
    // MARK: - Init
    public init() {}
}

extension CityDetailsInteractor: CityDetailsUseCase {}

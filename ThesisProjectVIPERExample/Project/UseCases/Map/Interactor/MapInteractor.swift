//
//  MapInteractor.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 24/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public class MapInteractor {
    // MARK: - Public properties
    public weak var output: MapUseCaseOutput!
    public var apiManager: MapEntityGateway!
    public var dataManager: MapDataGateway!
    
    // MARK: - Init
    public init() {}
}

extension MapInteractor: MapUseCase {}

//
//  ShowMapInteractor.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 24/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public class ShowMapInteractor {
    // MARK: - Public properties
    public weak var output: ShowMapUseCaseOutput!
    public var apiManager: ShowMapEntityGateway!
    public var dataManager: ShowMapDataGateway!
    
    // MARK: - Init
    public init() {}
}

extension ShowMapInteractor: ShowMapUseCase {
    public func getCities() -> [City] {
        return dataManager.getCities()
    }
}

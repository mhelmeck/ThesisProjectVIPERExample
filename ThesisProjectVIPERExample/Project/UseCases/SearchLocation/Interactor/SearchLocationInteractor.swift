//
//  SearchLocationInteractor.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 25/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public class SearchLocationInteractor {
    // MARK: - Public properties
    public weak var output: SearchLocationUseCaseOutput!
    public var apiManager: SearchLocationEntityGateway!
    public var dataManager: SearchLocationDataGateway!
    
    // MARK: - Init
    public init() {}
}

extension SearchLocationInteractor: SearchLocationUseCase {}

//
//  MainTableInteractor.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 23/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public class MainTableInteractor {
    // MARK: - Properties
    public weak var output: MainTableUseCaseOutput!
    public var dataManager: MainTableEntityGateway!
    
    // MARK: - Init
    public init() {}
}

extension MainTableInteractor: MainTableUseCase {
    
}

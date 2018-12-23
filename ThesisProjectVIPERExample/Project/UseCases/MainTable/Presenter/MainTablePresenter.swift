//
//  MainTablePresenter.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 23/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public class MainTablePresenter: MainTablePresentation {
    // MARK: - Properties
    public weak var view: MainTableView!
    public var interactor: MainTableUseCase!
    public var router: MainTableNavigation!
    
    // MARK: - Init
    public init() {}
}

extension MainTablePresenter: MainTableUseCaseOutput {
    
}

extension MainTablePresenter: MainTableEventHandler {
    
}

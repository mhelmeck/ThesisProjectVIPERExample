//
//  SearchLocationPresenter.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 25/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public class SearchLocationPresenter {
    // MARK: - Public properties
    public weak var view: SearchLocationView!
    public var interactor: SearchLocationUseCase!
    public var router: SearchLocationNavigation!
    
    // MARK: - Init
    public init() {}
}

extension SearchLocationPresenter: SearchLocationPresentation {}

extension SearchLocationPresenter: SearchLocationEventHandler {
    public func handleViewReady() {}
    
    public func handleViewDidAppear() {}
}

extension SearchLocationPresenter: SearchLocationUseCaseOutput {}

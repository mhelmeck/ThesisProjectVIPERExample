//
//  SearchLocationPresenterIO.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 25/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public protocol SearchLocationPresentation: class {
    func getNumberOfCells() -> Int
    func configureCell(atRow row: Int, configure: (LocationCellViewModel) -> Void)
}

public protocol SearchLocationView: class {
    func reloadView()
    func setLoadingState(isLoading: Bool)
    func setCurrentLocationLabel(_ text: String) 
    func enableCurrentButton()
}

public protocol SearchLocationEventHandler: class {
    func handleViewReady()
    func handleViewDidAppear()
    func handleSearch(phrase: String)
    func handleSearchCurrent()
    func handleCancel()
    func handleCellPressed(atRow row: Int)
    func handleLocationDidChange(latitude: Double, longitude: Double)
}

public protocol SearchLocationNavigation: class {
    func navigateToList()
}

public struct LocationCellViewModel {
    public let cityName: String
}

//
//  CitiesListPresenterIO.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 23/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public protocol CitiesListPresentation: class {
    func getNumberOfCells() -> Int
    func configureCell(atRow row: Int, configure: (CitiesListCellViewModel) -> Void)
}

public protocol CitiesListView: class {
    func reloadView()
    func setLoadingState(isLoading: Bool)
    func setSeparatorStyle(_ style: SeparatorStyle)
}

public protocol CitiesListEventHandler: class {
    func handleViewReady()
    func handleViewDidAppear()
    func handleCellPressed(atRow row: Int)
    func handleNaviagationPressed(atRow row: Int)
    func handleAddPressed()
}

public protocol CitiesListNavigation: class {
    func navigateToCityDetails(atRow row: Int)
    func navigateToMap(atRow row: Int)
    func navigateToSearchLocation()
}

public struct CitiesListCellViewModel {
    public var cityName: String
    public var temperature: String
    public var iconName: String
}

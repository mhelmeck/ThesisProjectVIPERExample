//
//  CitiesListPresenterIO.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 23/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public protocol CitiesListPresentation: class {
    func getNumberOfCells() -> Int
    func configureCell(atRow row: Int, configure: (String, String, String) -> Void)
}

public protocol CitiesListView: class {
    func reloadView()
    func isLoading(_ isLoading: Bool)
    func setSeparatorStyle(_ style: SeparatorStyle)
}

public protocol CitiesListEventHandler: class {
    func handleViewReady()
    func handleViewDidAppear()
    func handleCellPressed(atRow row: Int)
    func handleNaviagationPressed(atRow row: Int)
}

public protocol CitiesListNavigation: class {
    func navigateToDetails()
    func navigateToMap(atRow row: Int)
}

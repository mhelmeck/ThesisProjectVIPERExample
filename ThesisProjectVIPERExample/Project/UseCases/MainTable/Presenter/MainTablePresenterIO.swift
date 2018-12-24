//
//  MainTablePresenterIO.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 23/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public protocol MainTablePresentation: class {
    func getNumberOfCells() -> Int
    func configureCell(atRow row: Int, configure: (String, String, String) -> Void)
}

public protocol MainTableView: class {
    func reloadView()
    func isLoading(_ isLoading: Bool)
    func setSeparatorStyle(_ style: SeparatorStyle)
}

public protocol MainTableEventHandler: class {
    func handleViewReady()
    func handleViewDidAppear()
    func handleCellPressed(atRow: Int)
    func handleNaviagationPressed(atRow: Int)
}

public protocol MainTableNavigation: class {
    func navigateToDetails()
    func navigateToMap()
}

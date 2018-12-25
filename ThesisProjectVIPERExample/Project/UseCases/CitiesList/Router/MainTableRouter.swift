//
//  CitiesListRouter.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 23/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

import UIKit

public class CitiesListRouter {
    // MARK: - Public properties
    public typealias OtherBuilders = ShowMapBuilder
    
    public var builder: OtherBuilders!
    public weak var viewController: UIViewController!
    
    // MARK: - Init
    public init() {}
}

extension CitiesListRouter: CitiesListNavigation {
    public func navigateToDetails() {
        
    }
    
    public func navigateToMap(atRow row: Int) {
        let showMapViewController = builder.buildShowMap(forRow: row)
        
        viewController.navigationController?.pushViewController(showMapViewController, animated: true)
    }
}

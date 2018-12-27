//
//  SearchLocationRouter.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 25/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

import UIKit

public class SearchLocationRouter {
    // MARK: - Public properties
    public typealias OtherBuilders = CitiesListBuilder
    
    public var builder: OtherBuilders!
    public weak var viewController: UIViewController!
    
    // MARK: - Init
    public init() {}
}

extension SearchLocationRouter: SearchLocationNavigation {
    public func navigateToList() {
        viewController.navigationController?.popViewController(animated: true)
    }
}

//
//  CityDetailsRouter.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 24/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

import UIKit

public class CityDetailsRouter {
    // MARK: - Public properties
    public typealias OtherBuilders = CitiesListRouter
    
    public var builder: OtherBuilders!
    public weak var viewController: UIViewController!
    
    // MARK: - Init
    public init() {}
}

extension CityDetailsRouter: CityDetailsNavigation {}

//
//  MainTableRouter.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 23/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

import UIKit

public class MainTableRouter {
    // MARK: - Properties
    public typealias OtherBuilders = MapBuilder
    
    public var builder: OtherBuilders!
    public weak var viewController: UIViewController!
    
    // MARK: - Init
    public init() {}
}

extension MainTableRouter: MainTableNavigation {
    public func navigateToDetails() {
        viewController.performSegue(withIdentifier: "PushDetailsSegue", sender: nil)
    }
    
    public func navigateToMap() {
        viewController.performSegue(withIdentifier: "PushMapSegue", sender: nil)
    }
}

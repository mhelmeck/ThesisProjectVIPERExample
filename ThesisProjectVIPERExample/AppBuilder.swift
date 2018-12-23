//
//  AppBuilder.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 23/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

import UIKit

public class AppBuilder {
    public init() {
        
    }
    
    internal func buildMain() -> UIViewController {
        let viewC = UIViewController()
        viewC.view.backgroundColor = .red
        
        return viewC
    }
}

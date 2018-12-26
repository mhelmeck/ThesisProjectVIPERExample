//
//  CityDetailsBuilder.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 24/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

import UIKit

public protocol CityDetailsBuilder: class {
    func buildCityDetails(forRow row: Int) -> UIViewController
}

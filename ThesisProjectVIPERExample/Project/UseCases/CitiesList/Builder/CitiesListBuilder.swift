//
//  CitiesListBuilder.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 23/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

import UIKit

public protocol CitiesListBuilder: class {
    func buildCitiesList() -> UIViewController
}
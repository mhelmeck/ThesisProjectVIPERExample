//
//  MainTableViewController.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 23/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

import UIKit

public class MainTableViewController: UITableViewController {
    public var presenter: MainTablePresentation!
    public var eventHandler: MainTableEventHandler!
}

extension MainTableViewController: MainTableView {}

//
//  CitiesListViewController.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 23/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

import UIKit

public class CitiesListViewController: UITableViewController {
    // MARK: - Public properties
    public var presentation: CitiesListPresentation!
    public var eventHandler: CitiesListEventHandler!
    
    // MARK: - Private properties
    private let activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .gray)
        
        return view
    }()
    
    // MARK: - Init
    override public func viewDidLoad() {
        super.viewDidLoad()

        registerCell()
        setupNavigationItem()
        setupTableView()
        
        eventHandler.handleViewReady()
    }
    
    @objc
    private func addButtonItemTapped() {
        eventHandler.handleAddPressed()
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        eventHandler.handleViewDidAppear()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - Private methods
    private func registerCell() {
        let nib = UINib(nibName: CityCellView.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CityCellView.identifier)
    }
    
    private func setupNavigationItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addButtonItemTapped))
    }
    
    private func setupTableView() {
        tableView.backgroundView = activityIndicatorView
        tableView.separatorStyle = .none
    }
}

extension CitiesListViewController: CitiesListView {
    public func setSeparatorStyle(_ style: SeparatorStyle) {
        switch style {
        case .singleLine:
            tableView.separatorStyle = .singleLine
        case .none:
            tableView.separatorStyle = .none
        }
    }
    
    public func isLoading(_ isLoading: Bool) {
        isLoading ? activityIndicatorView.startAnimating() : activityIndicatorView.stopAnimating()
    }
    
    public func reloadView() {
        tableView.reloadData()
    }
}

public extension CitiesListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presentation.getNumberOfCells()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityCellView.identifier,
                                                       for: indexPath) as? CityCellView else {
            fatalError("Failed to dequeue reusable cell")
        }
        
        cell.delegate = self
        presentation.configureCell(atRow: indexPath.row) { cellViewModel in
            cell.cityNameLabel.text = cellViewModel.cityName
            cell.tempLabel.text = cellViewModel.temperature
            cell.iconImageView.image = UIImage(named: cellViewModel.iconName)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        eventHandler.handleCellPressed(atRow: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 60.0
    }
}

extension CitiesListViewController: CityCellViewDelegate {
    public func cityCellViewDidTapNavigationButton(_ cell: CityCellView) {
        guard let row = tableView.indexPath(for: cell)?.row else {
            return
        }
        
        eventHandler.handleNaviagationPressed(atRow: row)
    }
}

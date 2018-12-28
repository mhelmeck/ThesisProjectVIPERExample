//
//  SearchLocationViewController.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 25/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

import MapKit
import UIKit

public class SearchLocationViewController: UIViewController {
    // MARK: - Public properties
    public var presentation: SearchLocationPresentation!
    public var eventHandler: SearchLocationEventHandler!
    
    // MARK: - Private properties
    @IBOutlet private weak var cancelButton: UIButton!
    @IBOutlet private weak var searchButton: UIButton!
    @IBOutlet private weak var searchCurrentButton: UIButton!
    @IBOutlet private weak var searchField: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var currentLocationLabel: UILabel!
    
    private let locationManager = CLLocationManager()
    private var activityIndicatorView: UIActivityIndicatorView!
    
    // MARK: - Init
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        setupCoreLocation()
        
        setupView()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        eventHandler.handleViewDidAppear()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Private methods
    @IBAction private func searchButtonTapped(_ sender: Any) {
        guard let phrase = searchField.text else {
            return
        }
        
        eventHandler.handleSearch(phrase: phrase)
    }
    
    @IBAction private func cancelButtonTapped(_ sender: Any) {
        eventHandler.handleCancel()
    }
    
    @IBAction private func searchCurrentButtonTapped(_ sender: Any) {
        eventHandler.handleSearchCurrent()
    }
    
    private func setupCoreLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    private func setupView() {
        activityIndicatorView = UIActivityIndicatorView(style: .gray)
        tableView.separatorStyle = .singleLine
        
        setupTextField()
        setupButtons()
    }
    
    private func setupTextField() {
        searchField.delegate = self
        searchField.layer.cornerRadius = 4
        searchField.layer.borderWidth = 2
        searchField.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setupButtons() {
        [cancelButton, searchButton, searchCurrentButton].forEach {
            $0?.setTitleColor(.white, for: .normal)
            $0?.backgroundColor = .customBlue
            $0?.layer.cornerRadius = 4.0
        }
        
        cancelButton.setTitle("Cancel", for: .normal)
        searchButton.setTitle("Search", for: .normal)
        searchCurrentButton.setTitle("Current", for: .normal)
        
        searchCurrentButton.setBackground(color: .gray, forState: .disabled)
        searchCurrentButton.isEnabled = false
    }
}

extension SearchLocationViewController: SearchLocationView {
    public func reloadView() {
        tableView.reloadData()
    }
    
    public func setCurrentLocationLabel(_ text: String) {
        currentLocationLabel.text = text
    }
    
    public func enableCurrentButton() {
        searchCurrentButton.isEnabled = true
    }
    
    public func setLoadingState(isLoading: Bool) {
        if isLoading {
            self.view.addSubview(self.activityIndicatorView)
            self.activityIndicatorView.center = self.view.center
            self.activityIndicatorView.backgroundColor = UIColor.white
            
            self.activityIndicatorView.startAnimating()
            self.tableView.isHidden = true
            
            self.searchField.resignFirstResponder()
        } else {
            self.activityIndicatorView.stopAnimating()
            self.tableView.isHidden = false
        }
    }
}

extension SearchLocationViewController: UITextFieldDelegate {
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        searchField.layer.borderColor = UIColor.customBlue.cgColor
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        searchField.layer.borderColor = UIColor.gray.cgColor
    }
}

extension SearchLocationViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presentation.getNumberOfCells()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell") else {
            fatalError("Failed to dequeue reusable cell")
        }
        
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        presentation.configureCell(atRow: indexPath.row) { cellViewModel in
            cell.textLabel?.text = cellViewModel.cityName
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        eventHandler.handleCellPressed(atRow: indexPath.row)
    }
}

extension SearchLocationViewController: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        guard let currentLocation = locations.last else {
            return
        }
        
        eventHandler.handleLocationDidChange(latitude: currentLocation.coordinate.latitude,
                                             longitude: currentLocation.coordinate.longitude)
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get location with error: \(error)")
    }
}

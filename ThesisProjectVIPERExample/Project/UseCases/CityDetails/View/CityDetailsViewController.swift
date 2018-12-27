//
//  CityDetailsViewController.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 24/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

import UIKit

public class CityDetailsViewController: UIViewController {
    // MARK: - Public properties
    public var presentation: CityDetailsPresentation!
    public var eventHandler: CityDetailsEventHandler!
    
    // MARK: - Private properties
    @IBOutlet private weak var forecastView: ForecastUIView!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var previewButton: UIButton!
    @IBOutlet private weak var nextButton: UIButton!
    
    // MARK: - Init
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        eventHandler.handleViewReady()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Public methods
    
    // MARK: - Private methods
    @IBAction private func previewButtonTapped(_ sender: Any) {
        perform(animation: {
            self.forecastView.alpha = 0
        }, withCompletion: {
            self.eventHandler.handlePreviewPressed()
        })
        
        perform(animation: {
            self.forecastView.alpha = 1
        }, withCompletion: nil)
    }
    
    @IBAction private func nextButtonTapped(_ sender: Any) {
        perform(animation: {
            self.forecastView.alpha = 0
        }, withCompletion: {
            self.eventHandler.handleNextPressed()
        })
        
        perform(animation: {
            self.forecastView.alpha = 1
        }, withCompletion: nil)
    }
    
    private func setupView() {
        dateLabel.text = "".uppercased()
        
        previewButton.setTitle("Preview", for: .normal)
        nextButton.setTitle("Next", for: .normal)
        
        [previewButton, nextButton].forEach {
            $0?.setTitleColor(.white, for: .normal)
            
            $0?.backgroundColor = .customBlue
            $0?.setBackground(color: .gray, forState: .disabled)
            $0?.layer.cornerRadius = 4.0
            
            $0?.isEnabled = false
        }
    }
    
    private func perform(animation: @escaping () -> Void,
                         withCompletion completion: (() -> Void)?) {
        UIView.animate(
            withDuration: 0.75,
            delay: 0.0,
            options: .curveEaseOut,
            animations: { animation() },
            completion: { _ in completion?() }
        )
    }
}

extension CityDetailsViewController: CityDetailsView {
    public func setTitle(title: String) {
        self.navigationItem.title = title
    }
    
    public func updateView(withForecastViewModel viewModel: ForecastViewModel) {
        forecastView.imageView.image = UIImage(named: viewModel.iconName)
        forecastView.typeValue.text = viewModel.typeTextValue
        forecastView.minTempValue.text = viewModel.minTempTextValue
        forecastView.maxTempValue.text = viewModel.maxTempTextValue
        forecastView.windSpeedValue.text = viewModel.windSpeedTextValue
        forecastView.windDirectionValue.text = viewModel.windDirectionTextValue
        forecastView.rainfallValue.text = viewModel.rainfallTextValue
        forecastView.pressureValue.text = viewModel.pressureTextValue
    }
    
    public func setDate(date: String) {
        dateLabel.text = date
    }
    
    public func disableButton(buttonType: ButtonType) {
        switch buttonType {
        case .next:
            nextButton.isEnabled = false
        case .preview:
            previewButton.isEnabled = false
        }
}
    
    public func enableButton(buttonType: ButtonType) {
        switch buttonType {
        case .next:
            nextButton.isEnabled = true
        case .preview:
            previewButton.isEnabled = true
        }
    }
}

//
//  CityDetailsPresenter.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 24/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public class CityDetailsPresenter {
    // MARK: - Public properties
    public weak var view: CityDetailsView!
    public var interactor: CityDetailsUseCase!
    public var router: CityDetailsNavigation!
    
    // MARK: - Private properties
    private let row: Int
    private var forecastIndex: Int
    private var city: City!

    // MARK: - Init
    public init(row: Int) {
        self.row = row
        forecastIndex = 0
    }
}

extension CityDetailsPresenter: CityDetailsPresentation {}

extension CityDetailsPresenter: CityDetailsEventHandler {
    public func handleViewReady() {
        city = interactor.getCities()[row]
    
        view.setTitle(title: city.name)
        updateView()
    }
    
    public func handleViewDidAppear() {
        
    }
    
    public func handleNextPressed() {
        forecastIndex += 1
        updateView()
    }
    
    public func handlePreviewPressed() {
        forecastIndex -= 1
        updateView()
    }
    
    private func updateView() {
        let forecastCollection = city.forecastCollection
        let forecast = forecastCollection[forecastIndex]
        let date = forecast.date
        let iconName = AssetCodeMapper.map(forecast.assetCode)
        let typeTextValue = forecast.type
        let minTempTextValue = [String(Int(forecast.minTemperature)), "°C"].joined(separator: " ")
        let maxTempTextValue = [String(Int(forecast.maxTemperature)), "°C"].joined(separator: " ")
        let windSpeedTextValue = [String(Int(forecast.windSpeed)), "m/s"].joined(separator: " ")
        let windDirectionTextValue = forecast.windDirection
        let pressureTextValue = [String(Int(forecast.airPressure)), "hPa"].joined(separator: " ")
        var rainfallTextValue = ""
        switch forecast.assetCode {
        case "h", "hr", "lr", "s", "t":
            rainfallTextValue = "It's raining"
        default:
            rainfallTextValue = "It's not raining"
        }
        
        let forecastViewModel = ForecastViewModel(iconName: iconName,
                                                  typeTextValue: typeTextValue,
                                                  minTempTextValue: minTempTextValue,
                                                  maxTempTextValue: maxTempTextValue,
                                                  windSpeedTextValue: windSpeedTextValue,
                                                  windDirectionTextValue: windDirectionTextValue,
                                                  rainfallTextValue: rainfallTextValue,
                                                  pressureTextValue: pressureTextValue)
        
        view.updateView(withForecastViewModel: forecastViewModel)
        view.setDate(date: date)
        
        handleButtons()
    }
    
    private func handleButtons() {
        let forecastCollection = city.forecastCollection
        
        if forecastIndex == 0 {
            view.disableButton(buttonType: .preview)
            if forecastIndex != forecastCollection.count - 1 {
                view.enableButton(buttonType: .next)
            }
        }
        
        if forecastIndex == forecastCollection.count - 1 {
            view.disableButton(buttonType: .next)
            if forecastIndex != 0 {
                view.enableButton(buttonType: .preview)
            }
        }
        
        if forecastIndex > 0 && forecastIndex < forecastCollection.count - 1 {
            view.enableButton(buttonType: .preview)
            view.enableButton(buttonType: .next)
        }
    }
}

extension CityDetailsPresenter: CityDetailsUseCaseOutput {}

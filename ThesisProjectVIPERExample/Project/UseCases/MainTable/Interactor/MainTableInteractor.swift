//
//  MainTableInteractor.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 23/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

public class MainTableInteractor {
    // MARK: - Properties
    public weak var output: MainTableUseCaseOutput!
    public var apiManager: MainTableEntityGateway!
    public var dataManager: MainTableDataGateway!
    
    // MARK: - Init
    public init() {}
}

extension MainTableInteractor: MainTableUseCase {
    public func fetchInitialData() {
        let initialCityCodes = ["44418", "4118", "804365"]
        var requestCounter = initialCityCodes.count
    
        initialCityCodes.forEach {
            apiManager.fetchForecast(forCode: $0) { [weak self] in
                guard let self = self else { return }

                let adapter = CityAdapter(apiForecast: $0)
                self.dataManager.addCity(city: adapter.toCity())
                requestCounter -= 1
                if requestCounter == 0 {
                   self.output.didFetchData()
                }
            }
        }
    }
    
    public func getCities() -> [City] {
        return dataManager.getCities()
    }
}

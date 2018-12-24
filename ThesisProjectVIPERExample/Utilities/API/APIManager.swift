//
//  APIManager.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 23/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

import Foundation

public class APIManager: APIManagerType {
    // MARK: - Public methods
    public func fetchForecast(forCode code: String, completion: @escaping (APIForecast) -> Void) {
        let urlString = "https://www.metaweather.com/api/location/\(code)/"
        
        fetchData(withURLString: urlString) { (result: APIResult<APIForecast>) in
            switch result {
            case .error(let error):
                print("Error: \(error)")
            case .success(let result):
                completion(result)
            }
        }
    }
    
    public func fetchParents(withCoordinate latitude: String,
                             _ longitude: String,
                             completion: @escaping ([APIParent]) -> Void) {
        let urlString = "https://www.metaweather.com/api/location/search/?lattlong=\(latitude),\(longitude)"
        
        fetchParents(withURLString: urlString, completion: completion)
    }
    
    public func fetchParents(withQuery query: String, completion: @escaping ([APIParent]) -> Void) {
        let formattedQuery = query.replacingOccurrences(of: " ", with: "%20")
        let urlString = "https://www.metaweather.com/api/location/search/?query=\(formattedQuery)"
        
        fetchParents(withURLString: urlString, completion: completion)
    }
    
    private func fetchParents(withURLString urlString: String, completion: @escaping ([APIParent]) -> Void) {
        fetchData(withURLString: urlString) { (result: APIResult<[APIParent]>) in
            switch result {
            case .error(let error):
                print("Error: \(error)")
            case .success(let result):
                completion(result)
            }
        }
    }
}

private extension APIManager {
    private func fetchData<T: Decodable>(withURLString urlString: String, completion: @escaping APIResultHandler<T>) {
        guard let url = URL(string: urlString) else {
            completion(.error(APIError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.error(error))
                return
            }
            
            guard let data = data else {
                completion(.error(APIError.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
            } catch let error {
                completion(.error(error))
            }
        }.resume()
    }
}

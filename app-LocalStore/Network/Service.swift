//
//  Service.swift
//  app-LocalStore
//
//  Created by Walter Luis Deonísio Junior on 18/10/20.
//

import Foundation

enum APIError: Error {
    case badURL
    case taskError
    case noResponse
    case invalidStatusCode(Int)
    case noData
    case invalidJSON
    
    var errorMessage: String {
        switch self {
        case .badURL:
            return "URL inválida"
        default:
            return ""
        }
    }
}

class Service {
    private static let basePath = "https://hotmart-mobile-app.herokuapp.com/locations"
    
    private static let configuration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        configuration.allowsCellularAccess = true
        configuration.timeoutIntervalForRequest = 30
        configuration.httpMaximumConnectionsPerHost = 5
        return configuration
    }()
    
    private static let session = URLSession(configuration: configuration)
    
    static func fetchLocations(onComplete: @escaping (Result<[Location], APIError>) -> Void) {
        
        guard let url = URL(string: basePath) else {
            return onComplete(.failure(.badURL))
        }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                return onComplete(.failure(.taskError))
            }
            
            guard let response = response as? HTTPURLResponse else {
                return onComplete(.failure(.noResponse))
            }
            
            if !(200...299 ~= response.statusCode) {
                return onComplete(.failure(.invalidStatusCode(response.statusCode)))
            }
            
            guard let data = data else {
                return onComplete(.failure(.noData))
            }
            
            do {
                let resultList = try JSONDecoder().decode(LocationsListResponse.self, from: data)
                onComplete(.success(resultList.listLocations))
            } catch let jsonError {
                print("Failed to decode JSON:", jsonError)
                return onComplete(.failure(.invalidJSON))
            }
        }
        task.resume()
    }
}

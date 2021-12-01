//
//  NetworkManager.swift
//  BreweriesApp
//
//  Created by Raul Shafigin on 30.11.2021.
//

import Alamofire

enum NetworkError: String, Error {
    case invalidUrl
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String, completion: @escaping(Result<[Brewery], NetworkError>) -> Void ) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let breweries = Brewery.getBreweries(from: value)
                    completion(.success(breweries))
                case .failure(let error):
                    print(NetworkError.noData)
                    print(error.localizedDescription)
            }
        }
    }
}

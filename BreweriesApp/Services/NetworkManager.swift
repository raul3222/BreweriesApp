//
//  NetworkManager.swift
//  BreweriesApp
//
//  Created by Raul Shafigin on 30.11.2021.
//

//import Foundation
import Alamofire

enum NetworkError: String, Error {
    case invalidUrl
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData<T: Decodable>(dataType: T.Type, from url: String, completion: @escaping(Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let type = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(type))
                }
            } catch let error{
                completion(.failure(.decodingError))
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    
}

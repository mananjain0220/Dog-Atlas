//
//  NetworkManager.swift
//  DogApp
//
//  Created by manan jain on 25/02/25.
//

import Foundation
final class NetworkManager {
    static let share = NetworkManager()
    static let baseURL = "https://api.thedogapi.com/v1"
    static private let apiKey = "live_FB0p8UeOAF5KbwMJgsn05RN1KlKVk18v4uDFNdhPooEkr5b6GA2fu3O7LbgqFk8X"
    private let breedURL = baseURL + "/breeds"
    
    private init() {}
    
    func fetchBreeds(completion: @escaping (Result<[DogApp], Error>) -> Void) {
        guard let url = URL(string: breedURL)  else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
                       return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(NetworkManager.apiKey, forHTTPHeaderField: "x-api-key")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completion(.failure(NSError(domain: "No data received", code: 404, userInfo: nil)))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(NSError(domain: "No data received", code: 404, userInfo: nil)))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 404, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let breeds = try decoder.decode([DogApp].self, from: data)
                completion(.success(breeds))
            }catch {
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
    
    

}

//
//  APIService.swift
//  SwiftUIMVVM
//
//  Created by Pawan Agrahari on 21/05/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
}

class APIService {
    
    static let shared = APIService()
    
    private init() {}
    
    func fetchData<T: Decodable>(from urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }
}

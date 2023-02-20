//
//  StoreHTTPClient.swift
//  StoreApp
//
//  Created by Mohammad Azam on 2/20/23.
//

import Foundation

class StoreHTTPClient {
    
    func loadProducts() async throws -> [Product] {
        
        guard let url = URL(string: "https://api.escuelajs.co/api/v1/products") else {
            throw NetworkError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let products = try JSONDecoder().decode([Product].self, from: data)
        return products
    }
    
}

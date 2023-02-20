//
//  ContentView.swift
//  StoreApp
//
//  Created by Mohammad Azam on 2/20/23.
//

import SwiftUI

enum NetworkError: Error {
    case invalidUrl
    case invalidResponse
}

struct ContentView: View {
    
    @State private var products: [Product] = []
    
    private func fetchProducts() async throws {
        
        guard let url = URL(string: "https://api.escuelajs.co/api/v1/products") else {
            throw NetworkError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        products = try JSONDecoder().decode([Product].self, from: data)
        
    }
    
    var body: some View {
        ProductListView(products: products)
            .task {
                do {
                    try await fetchProducts()
                } catch {
                    print(error.localizedDescription)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

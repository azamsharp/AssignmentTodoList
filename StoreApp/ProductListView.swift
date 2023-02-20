//
//  ProductListView.swift
//  StoreApp
//
//  Created by Mohammad Azam on 2/20/23.
//

import SwiftUI

struct ProductListView: View {
    
    let products: [Product]
    
    var body: some View {
        List(products) { product in
            Text(product.title)
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(products: [])
    }
}

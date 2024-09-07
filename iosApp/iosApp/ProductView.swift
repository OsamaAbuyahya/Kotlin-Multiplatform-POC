//
//  ProductView.swift
//  iosApp
//
//  Created by Osama Abu Yahya on 07/09/2024.
//  Copyright © 2024 orgName. All rights reserved.
//

import Foundation
import shared
import SwiftUI

struct ProductView: View {
    
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            
            AsyncImage(url: URL(string: product.image)) { imageUrl in
                if let image = imageUrl.image {
                    image.resizable()
                        .scaledToFit()
                        .animation(.default, value: image)
                        .accessibility(hidden: false)
                        .accessibilityLabel(Text("Product Thumbnaill"))
                } else if imageUrl.error != nil {
                    VStack {
                        Text("Image Not Available!")
                            .font(.title3)
                    }
                } else {
                    ProgressView().frame(maxWidth: .infinity)
                }
                
            }
            
            Text(product.title)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .truncationMode(.tail)
                .font(.title2.bold())
                .padding(.top, 10)
            
            Text(product.description_)
                .multilineTextAlignment(.leading)
                .lineLimit(6)
                .truncationMode(.tail)
                .font(.body)
                .padding(.top, 5)
                .padding(.bottom, 10)
            
            HStack {
                Text(product.category)
                    .font(.body.italic())
                
                Spacer()
                
                Text("$\(String(format: "%.2f", product.price))")
                    .font(.body.bold())
            }.padding(.vertical, 10)
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View{
        let sampleProduct = Product(
            id: 1,
            title: "Test Title",
            price: 22.3,
            description: "Test Description",
            category: "Man",
            image: ""
        )
        ProductView(product: sampleProduct).padding()
    }
}

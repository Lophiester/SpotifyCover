//
//  HomeViewModel.swift
//  SpotifyCover
//
//  Created by Charles Yamamoto on 2024/05/06.
//

import SwiftUI
import Observation
import SwiftfulUI

@Observable
class HomeViewModel {
    
    var currentUser: User? = nil
    var products: [Product] = []
    var selectedCategory: Category? = nil
    
    
    func getdata() async {
        do {
            currentUser = try await  DataBaseHelper().getUsers().first
            products =  try await Array(DataBaseHelper().getProducts().prefix(8))
        } catch  {
             print(error.localizedDescription)
        }
    }
    
    var header: some View {
        HStack(spacing: 0){
            ZStack{
              
            if let currentUser = currentUser{
                ImageLoaderView(urlImage: currentUser.image)
                 
                    .background(.spotifyWhite)
                    .clipShape(Circle())
                    .onTapGesture {
                        // MARK: TODO: Unimplemented Functions
                    }
            }
        }
            .frame(width: 35, height: 35)
            ScrollView(.horizontal){
                HStack(spacing: 8){
                    ForEach(Category.allCases, id: \.self){
                        categories in
                        CategoryView(
                            title: categories.rawValue.capitalized,
                            isSelected: categories == self.selectedCategory
                        )
                        .onTapGesture {
                            self.selectedCategory = categories
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
            
        }
        .padding(.vertical, 24)
        .padding(.leading,8)
        .background(Color.spotifyBlack)
        
    }
    
    var recentsSection: some View {
        NonLazyVGrid(
            columns: 2,
            alignment: .center,
            spacing: 10,
            items: products) { product in
                if let product {
                    RecentsView(
                        urlImage: product.firstImage,
                        title:product.title
                    )
                }
            }
    }
    func newReleaseSection(product: Product) -> some View {
        NewReleaseView(
            urlImage: product.firstImage,
            headline: product.brand,
            subheadline: product.category,
            title: product.title,
            subtitle: product.description) {
                // MARK: TODO: Unimplemented Functions
            } onPlayPressed: {
                // MARK: TODO: Unimplemented Functions
            }

    }
}

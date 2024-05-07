//
//  HomeViewModel.swift
//  SpotifyCover
//
//  Created by Charles Yamamoto on 2024/05/06.
//

import SwiftUI
import Observation

@Observable
class HomeViewModel {
    
    var currentUser: User? = nil
    var selectedCategory: Category? = nil
    
    
    func getdata() async {
        do {
            currentUser = try await  DataBaseHelper().getUsers().first
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
                        // TAP SOMETHING
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
}

//
//  HomeView.swift
//  SpotifyCover
//
//  Created by Charles Yamamoto on 2024/05/06.
//

import SwiftUI
import SwiftfulUI

struct HomeView: View {
    
    @State var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical){
                
                LazyVStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,
                           spacing: 1,
                           pinnedViews: [.sectionHeaders],
                           content: {
                    Section {
                        VStack{
                            NonLazyVGrid(
                                columns: 2,
                                alignment: .center,
                                spacing: 10,
                                items: viewModel.products) { product in
                                    if let product {
                                        RecentsView(
                                            urlImage: product.firstImage,
                                            title:product.title
                                        )
                                    }
                                }
                        }
                        
                        ForEach(0..<20){ _ in
                            Rectangle()
                                .fill(.red)
                                .frame(width: 200, height: 200)
                        }
                    } header: {
                        viewModel.header
                    }

                })
                .padding(.top,8)
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        .task {
            await viewModel.getdata()
        }
        .toolbar(.hidden, for: .navigationBar)
        
    }
    
}

#Preview {
    
    HomeView()
    
    
    
}

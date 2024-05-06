//
//  HomeView.swift
//  SpotifyCover
//
//  Created by Charles Yamamoto on 2024/05/06.
//

import SwiftUI

struct HomeView: View {
    
    @State var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            HStack{
                if let currentUser = viewModel.currentUser{
                    ImageLoaderView(urlImage: currentUser.image)
                        .frame(width: 30, height: 30)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            // TAP SOMETHING
                        }
                }
                ScrollView(.horizontal){
                    HStack(spacing: 8){
                        ForEach(0..<20){
                            _ in
                            Rectangle()
                                .frame(width: 10, height: 10)
                                .foregroundStyle(.white)
                        }
                    }
                }
                .scrollIndicators(.hidden)
                
            }
            
        }
        .task {
            await viewModel.getdata()
        }
        
    }
    
}

#Preview {
    
    HomeView()
    
    
    
}

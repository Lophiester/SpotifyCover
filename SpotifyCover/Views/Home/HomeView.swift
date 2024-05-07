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
                            viewModel.recentsSection
                        }
                        .padding(.horizontal,16)
                        
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

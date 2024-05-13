//
//  PlayListView.swift
//  SpotifyCover
//
//  Created by Charles Yamamoto on 2024/05/09.
//

import SwiftUI

struct PlaylistView: View {
    @State var viewModel = PlaylistViewModel()
    
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(
                           spacing: 12,
                           content: {
                    PlaylistHeaderView(
                        title: viewModel.product.title,
                        subtitle: viewModel.product.brand,
                        urlImage: viewModel.product.thumbnail
                    )
                    
                })
            }
            
        }
        
    }
}

#Preview {
    PlaylistView()
}

//
//  PlayListView.swift
//  SpotifyCover
//
//  Created by Charles Yamamoto on 2024/05/09.
//

import SwiftUI

struct PlaylistView: View {
    
    @State var product: Product = .mockProduct
    @State var user: User = .mockUser
    
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(
                    spacing: 12,
                    content: {
                        PlaylistHeaderView(
                            title: product.title,
                            subtitle: product.brand,
                            urlImage: product.thumbnail
                        )
                        PlaylistDescriptionView(
                            descriptionText: product.description,
                            userName: user.firstName,
                            subheadline: product.category)
                        .padding(.horizontal,16)
                        
                        
                    })
            }
            
        }
        
    }
}

#Preview {
    PlaylistView()
}

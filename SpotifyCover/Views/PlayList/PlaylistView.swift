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
    @State var products:[Product] = []
    
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
                        ForEach(products){ product in
                            SongRowView(
                                urlImage: product.firstImage,
                                imageSize: 60,
                                title: product.title,
                                subtitle: product.brand
                            )
                            .padding(.horizontal,16)
                        }
                    })
            }
            .scrollIndicators(.hidden)
            .task {
               await  getdata()
            }
        }
        
    }
    
   private  func getdata() async {
        do {
            products = try await DataBaseHelper().getProducts()
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    
}

#Preview {
    PlaylistView()
}

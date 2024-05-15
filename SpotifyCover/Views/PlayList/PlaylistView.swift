//
//  PlayListView.swift
//  SpotifyCover
//
//  Created by Charles Yamamoto on 2024/05/09.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct PlaylistView: View {
    
    @State var product: Product = .mockProduct
    @State var user: User = .mockUser
    @State var products:[Product] = []
    @State var isShowHeader: Bool = false
    @State var offset: CGFloat = 0
    
    @Environment (\.router) var router
    
    
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
                        //that's being used to calculate an offset. This property is being used to determine the maximum position of the frame (frame.maxY). The code then prints this offset.
                        .readingFrame { frame in
                            //offset = frame.maxY
                           // print(offset)
                            
                            isShowHeader = frame.maxY < 150
                        }
                        
                        
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
                                subtitle: product.brand,
                                onRowPressed: {
                                    goToPlaylistView(product: product)
                                }
                            )
                            .padding(.horizontal,16)
                        }
                    })
            }
            .scrollIndicators(.hidden)
            ZStack{
                Text(product.title)
                    .font(.headline)
                    .padding(.vertical, 20)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(.spotifyBlack)
                    .offset(y: isShowHeader ? 0 : -40)
                    .opacity(isShowHeader ? 1 : 0)
                
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .padding(10)
                    .background(isShowHeader ? .spotifyGray.opacity(0.001) :.spotifyGray.opacity(0.7))
                    .clipShape(Circle())
                    .padding(.leading,16)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .onTapGesture {
                        router.dismissScreenStack()
                    }
                
            }
            .foregroundStyle(.spotifyWhite)
            .animation(.smooth(duration: 0.2), value: isShowHeader)
            .frame(maxHeight: .infinity, alignment: .top)
            
            .task {
                await  getdata()
            }
        }
        .toolbar(.hidden)
    }
    
    private func goToPlaylistView(product: Product){
        router.showScreen(.push) { _ in
            PlaylistView(product: product, user: user)
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
    
    RouterView { _ in
       PlaylistView()
    }
}

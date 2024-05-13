//
//  PlaylistHeaderView.swift
//  SpotifyCover
//
//  Created by Charles Yamamoto on 2024/05/09.
//

import SwiftUI
import SwiftfulUI

struct PlaylistHeaderView: View {
    
    var title: String = "Title goes here."
    var subtitle: String = "Subtitle goes here."
    var urlImage = Constants.randomImage
    var height: CGFloat = 300
    var shadowColor: Color = .spotifyBlack.opacity(0.8)
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay {
                ImageLoaderView(urlImage: urlImage)
            }
      
            .overlay (alignment: .bottomLeading){
                VStack(alignment: .leading, spacing: 8){
                    Text(subtitle)
                        .font(.headline)
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .foregroundStyle(.spotifyWhite)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .padding(16)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .background(LinearGradient(colors: [shadowColor.opacity(0), shadowColor], startPoint: .top, endPoint: .bottom))
            }
        
        //.asStretchyHeader is a method in the SwiftfulUI package that extends the capabilities of expandable headers, allowing a header to dynamically adjust while scrolling in a user interface.
            .asStretchyHeader(startingHeight: height)
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        ScrollView {
            PlaylistHeaderView()
        }
        .ignoresSafeArea()
        
    }
}

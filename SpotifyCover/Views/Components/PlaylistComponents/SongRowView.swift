//
//  SonRowView.swift
//  SpotifyCover
//
//  Created by Charles Yamamoto on 2024/05/14.
//

import SwiftUI

struct SongRowView: View {
    
    var urlImage = Constants.randomImage
    var imageSize: CGFloat = 50
    var title: String? = "Title goes here"
    var subtitle: String? = "Subtitle goes here"
    var onRowPressed: (()-> Void)? = nil
    var onEllipsisPreesed: (()-> Void)? = nil
  
    
    
    
    var body: some View {
        
        HStack(spacing: 8){
                ImageLoaderView(urlImage: urlImage)
                    .frame(width: imageSize, height: imageSize)
                VStack(alignment: .leading, spacing: 4){
                    if let title {
                        Text(title)
                            .font(.body)
                            .fontWeight(.medium)
                            .foregroundStyle(.spotifyWhite)
                    }
                     
                    if let subtitle {
                        Text(subtitle)
                            .font(.callout)
                            .foregroundStyle(.spotifyLightGray)
                    }
                    
                }
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
             
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                Image(systemName: "ellipsis")
                    .font(.subheadline)
                    .foregroundStyle(.spotifyWhite)
                    .opacity(16)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                      onEllipsisPreesed?()
                    }
            }
        .background(.black.opacity(0.001))
        .onTapGesture {
            onRowPressed?()
        }
        
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        VStack{
            SongRowView()
            SongRowView()
            SongRowView()
        }
    }
}

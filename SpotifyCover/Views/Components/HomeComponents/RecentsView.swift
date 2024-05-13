//
//  RecentsView.swift
//  SpotifyCover
//
//  Created by Charles Yamamoto on 2024/05/07.
//

import SwiftUI

struct RecentsView: View {
    var urlImage = Constants.randomImage
    var imageSize: CGFloat = 50
    var title: String = "Title goes here"
    
    
    var body: some View {
        HStack(spacing: 16){
            ImageLoaderView(urlImage: urlImage)
                .frame(width: imageSize, height: imageSize)
                Text(title)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(.spotifyWhite)
                    .lineLimit(2)
        }
        .padding(.trailing, 8)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        .background(.spotifyDarkGray)
        .foregroundStyle(.spotifyWhite)
        .clipShape(.buttonBorder)
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        VStack{
            HStack{
                RecentsView()
                RecentsView()
            }
            HStack{
                RecentsView()
                RecentsView()
            }
        }
        }
        
     

}

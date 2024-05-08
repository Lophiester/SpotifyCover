//
//  ImageRowCell.swift
//  SpotifyCover
//
//  Created by Charles Yamamoto on 2024/05/08.
//

import SwiftUI

struct ImageRowView: View {
    
    var urlImage = Constants.randomImage
    var imageSize: CGFloat = 100
    var title: String = "Title goes here"
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 4){
            ImageLoaderView(urlImage: urlImage)
                .frame(width: imageSize, height: imageSize)
            Text(title)
                .font(.callout)
                .foregroundStyle(.spotifyLightGray)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .padding(4)
            
        }
        .frame(width: imageSize)
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        ImageRowView()
        
    }
    
}

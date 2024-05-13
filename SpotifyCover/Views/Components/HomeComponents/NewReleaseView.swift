//
//  NewReleaseView.swift
//  SpotifyCover
//
//  Created by Charles Yamamoto on 2024/05/07.
//

import SwiftUI

struct NewReleaseView: View {
    
    var urlImage = Constants.randomImage
    var headline: String? = "Headline goes here"
    var subheadline: String? = "Subheadline goes here"
    var title: String? = "Title goes here"
    var subtitle: String? = "Subtitle goes here"
    var onAddToPlayListPresssed:(()-> Void)? = nil
    var onPlayPressed:(()-> Void)? = nil
    
    var body: some View {
        VStack(spacing: 16){
            HStack(spacing: 8){
                ImageLoaderView(urlImage: urlImage)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 2){
                    if let headline{
                        Text(headline)
                            .font(.callout)
                            .foregroundStyle(.spotifyLightGray)
                    }
                    if let subheadline{
                        Text(subheadline)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.spotifyWhite)
                    }
                    
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            HStack{
                ImageLoaderView(urlImage: urlImage)
                    .frame(width: 150, height: 150)
                
                
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading){
                        if let title {
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.spotifyWhite)
                        }
                        if let subtitle{
                            Text(subtitle)
                                .foregroundStyle(.spotifyLightGray)
                        }
                    }
                    .font(.callout)
                    
                    HStack{
                        Image(systemName: "plus.circle")
                            .font(.title3)
                            .foregroundStyle(.spotifyLightGray)
                            .padding(4)
                            .background(.black.opacity(0.001))
                            .onTapGesture {
                                onAddToPlayListPresssed?()}
                            .offset(x: -4)
                        Spacer()
                        Image(systemName: "play.circle.fill")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(.spotifyWhite)
                            .onTapGesture {
                                onPlayPressed?()
                            }
                    }
                }
                .padding(.trailing, 16)
            }
            .background(.spotifyDarkGray)
            .clipShape(.buttonBorder)
        }
        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        NewReleaseView()
    }
    
}

//
//  PlaylistDescriptionView.swift
//  SpotifyCover
//
//  Created by Charles Yamamoto on 2024/05/13.
//

import SwiftUI

struct PlaylistDescriptionView: View {
    
    var descriptionText: String = Product.mockProduct.description
    var userName: String = "Charles"
    var subheadline: String  = "some subheadline goes here"
    var onAddToPlaylistButtonPressed:(()->Void)? = nil
    var onDownloadButtonPressed:(()->Void)? = nil
    var onShareButtonPressed:(()->Void)? = nil
    var onEllipisButtonPressed:(()->Void)? = nil
    var onShuffleButtonPressed:(()-> Void)? = nil
    var onPlayButtonpressed:(()-> Void)? = nil
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8, content: {
            Text(descriptionText)
                .foregroundStyle(.spotifyLightGray)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            madeForYou
            Text(subheadline)
                .foregroundStyle(.spotifyLightGray)
            buttonRow
        })
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(.spotifyLightGray)}
    
    
   
    private var madeForYou: some View{
        HStack(spacing: 8, content: {
            Image(systemName: "applelogo")
                .font(.title3)
                .foregroundStyle(.spotifyGreen)
            Text("made for ")
                .foregroundStyle(.spotifyLightGray)
            +
            Text(userName)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.spotifyWhite)
            
        })
    }
    
    private var buttonRow: some View {
        HStack(spacing: 0){
            HStack (spacing: 0, content: {
            Image(systemName: "plus.circle")
                .padding(8)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    onAddToPlaylistButtonPressed?()
                }
            Image(systemName: "arrow.down.circle")
                .padding(8)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    onDownloadButtonPressed?()
                }
            Image(systemName: "square.and.arrow.down")
                .padding(8)
                .background(.black.opacity(0.001))
                .onTapGesture {
                   onShareButtonPressed?()
                }
            Image(systemName: "ellipsis")
                .padding(8)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    onEllipisButtonPressed?()
                }
            
        })
        .offset(x: -8)
            Spacer()
            HStack{
                Image(systemName: "shuffle")
                    .font(.system(size: 24))
                    .background(.black.opacity(0.001))
                    .padding(8)
                    .onTapGesture {
                        onShuffleButtonPressed?()
                    }
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 42))
                    .background(.black.opacity(0.001))
                    .padding(8)
                    .onTapGesture {
                        onPlayButtonpressed?()
                    }
            }
           
            .foregroundStyle(.spotifyGreen)
    }
        .font(.title2)
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        PlaylistDescriptionView()
    }

}

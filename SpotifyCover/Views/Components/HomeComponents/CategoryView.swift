//
//  CategoryView.swift
//  SpotifyCover
//
//  Created by Charles Yamamoto on 2024/05/06.
//

import SwiftUI

struct CategoryView: View {
    var title: String = "All"
    var isSelected: Bool = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 30)
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
            .clipShape(.capsule)
            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        VStack(spacing: 40){
            CategoryView( isSelected: true)
            CategoryView()
            CategoryView()
            CategoryView(isSelected: true)
        }
    }
  
}

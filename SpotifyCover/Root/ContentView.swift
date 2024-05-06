//
//  ContentView.swift
//  SpotifyCover
//
//  Created by Charles Yamamoto on 2024/05/06.
//

import SwiftUI

struct ContentView: View {
    @State private var users:[User] = []
    @State private var products:[Product] = []
    
    var body: some View {
        ScrollView{
            VStack {
                ForEach(users) { user in
                    /*@START_MENU_TOKEN@*/Text(user.firstName)/*@END_MENU_TOKEN@*/
                }
            }
        }
        .padding()
        .task {
            await getData()
        }
        
    }
    private func getData () async {
        do{
            users = try await DataBaseHelper().getUsers()
            products = try await DataBaseHelper().getProducts()
        }
        catch{
            print(error.localizedDescription)
        }
        
    }
}


#Preview {
    ContentView()
}

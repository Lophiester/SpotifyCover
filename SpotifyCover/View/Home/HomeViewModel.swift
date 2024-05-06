//
//  HomeViewModel.swift
//  SpotifyCover
//
//  Created by Charles Yamamoto on 2024/05/06.
//

import Foundation
import Observation

@Observable
class HomeViewModel {
    
    var currentUser: User? = nil
    
    
    func getdata() async {
        do {
            currentUser = try await  DataBaseHelper().getUsers().first
        } catch  {
             print(error.localizedDescription)
        }
    }
}

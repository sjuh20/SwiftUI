//
//  ProfileViewModel.swift
//  MVVM
//
//  Created by Ana Julia Brito de Souza on 06/02/23.
//

import Foundation


//MARK: - VIEWMODEL
class ProfileViewModel: ObservableObject {
    
    @Published var isFollowing = false
    @Published var userFollowers = String()
    @Published var date = Date()
    
    var user = User(picture: "perfil_mariana",
                    name: "Mariana Rocha",
                    nick: "@rochamari",
                    followers: 22643)
    
    init(){
        loadFollowers()
    }
    
    func loadFollowers() {
        self.userFollowers = custumizeNumber(value: user.followers)
    }
    
    func custumizeNumber(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt-BR")
        let shorten = formatter.string(for: value) ?? "0"
        return "\(shorten)K"
    }
    
    
    func followToogle(){
        self.isFollowing.toggle()
        self.isFollowing ? (self.user.followers += 1) : (self.user.followers -= 1)
        loadFollowers()
    }
}

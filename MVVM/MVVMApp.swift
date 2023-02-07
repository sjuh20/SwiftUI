//
//  MVVMApp.swift
//  MVVM
//
//  Created by Ana Julia Brito de Souza on 06/02/23.
//

import SwiftUI

@main
struct MVVMApp: App {
    var body: some Scene {
        WindowGroup {
            ProfileView()
                .environmentObject(ProfileViewModel())
        }
    }
}

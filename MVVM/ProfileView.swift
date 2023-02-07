//
//  ContentView.swift
//  MVVM
//
//  Created by Ana Julia Brito de Souza on 06/02/23.
//

import SwiftUI

//MARK: - VIEW

struct ProfileView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        
        VStack {
            DatePickerView()
            ProfileDataView()
            ActionView()
        }
        .animation(.easeInOut, value: viewModel.isFollowing)
    }
}

struct DatePickerView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        
        HStack {
            DatePicker(
                "Selecione a data do evento",
                selection: $viewModel.date,
                displayedComponents: .date)
            .datePickerStyle(.compact)
            .labelsHidden()
            .environment(\.locale, Locale.init(identifier: "pt"))
        }
    }
}

struct ProfileDataView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        
        Image(viewModel.user.picture)
            .resizable()
            .frame(width: 250,height: 250)
            .padding(.bottom, 10)
        
        Text(viewModel.user.name)
            .font(.system(size: 50, weight: .bold))
        
        Text(viewModel.user.nick)
            .font(.system(size: 23, weight: .regular))
            .foregroundColor(.gray)
        
        Text("\(viewModel.userFollowers)")
            .font(.system(size: 80, weight: .light))
            .padding(viewModel.isFollowing ? 40: 25)
    }
}

struct ActionView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        
        VStack {
            
            //Seguir ---
            Button{ viewModel.followToogle()} label: {
                Label(!viewModel.isFollowing ? "follow": "unfollow", systemImage: "person.crop.circle.fill.badge.plus")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(!viewModel.isFollowing ? .blue : .black)
            
            
            //Enviar Mensagem ---
            Button{} label: {
                Label("enviar mensagem", systemImage: "paperplane.fill")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .disabled(!viewModel.isFollowing)
        }
        .padding(20)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(ProfileViewModel())
    }
}

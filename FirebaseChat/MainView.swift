//
//  ContentView.swift
//  FirebaseChat
//
//  Created by 정은주 on 4/14/24.
//

import SwiftUI

class MainViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
}

struct MainView: View {
    @StateObject var viewModel = MainViewModel()

    var body: some View {
        if viewModel.isLoggedIn {
            HomeView(viewModel: viewModel)
        } else {
            LoginJoinView(viewModel: viewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//
//  HomeView.swift
//  FirebaseChat
//
//  Created by 정은주 on 4/14/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        NavigationStack {
            VStack {
                // 홈 화면 UI 구성
                Text("홈 뷰")
                Divider()
                Button("로그아웃") {
                    viewModel.isLoggedIn = false
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: MainViewModel())
    }
}

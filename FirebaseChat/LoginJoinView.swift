//
//  LoginJoinView.swift
//  FirebaseChat
//
//  Created by 정은주 on 4/14/24.
//

//  LoginJoinView.swift

//  LoginJoinView.swift

import SwiftUI

struct LoginJoinView: View {
    @ObservedObject var viewModel: MainViewModel
    @State var isLoginMode = false
    @State var email = ""
    @State var password = ""
    @State var profileImage: UIImage?

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    
                    if isLoginMode {
                        //로그인화면
                        //입력란
                        Group {
                            TextField("이메일", text: $email)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                            SecureField("암호", text: $password)
                        }
                        .padding(12)
                        .background(Color.white)
                        
                        MyButton(title: "로그인", color: .blue) {
                            loginUserAction()
                        }
                        
                        MyButton(title: "회원가입", color: Color(.init(red: 0.5, green: 0.2, blue: 0.9, alpha: 1.0))) {
                            isLoginMode.toggle()
                        }
                    } else {
                        //회원가입 화면
                        
                        //프로필 이미지 설정
                        Button {
                            print("Button Tapped!")
                        } label: {
                            VStack {
                                if let profileImage = self.profileImage {
                                    Image(uiImage: profileImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 64, height: 64)
                                        .cornerRadius(32)
                                }else{
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 32))
                                        .padding()
                                        .foregroundColor(Color(.label))
                                }
                            }
                            .overlay(RoundedRectangle(cornerRadius: 64)
                                .stroke(Color.black, lineWidth: 3))
                        }
                        //입력란
                        Group {
                            TextField("이메일", text: $email)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                            SecureField("암호", text: $password)
                        }
                        .padding(12)
                        .background(Color.white)
                        
                        MyButton(title: "회원가입", color: .blue) {
                            print("Button Tapped!")
                        }
                        
                        MyButton(title: "로그인", color: Color(.init(red: 0.5, green: 0.2, blue: 0.9, alpha: 1.0))) {
                            isLoginMode.toggle()
                        }
                    }
                    
                }//VStack
                .padding(16)
            }//ScrollView
            .navigationBarTitle(isLoginMode ? "로그인" : "회원가입")
            .background(Color(.init(gray: 0.1, alpha: 0.1))
                .ignoresSafeArea())
        }//NavigationView
    }//View
    
    func loginUserAction() {
            FirebaseUtil.shared.auth.signIn(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    print("로그인 중 오류 발생: \(error.localizedDescription)")
                    return
                }
                print("로그인한 사용자: \(authResult?.user.email ?? "")")
                print("로그인한 사용자: \(authResult?.user.uid ?? "")")
            }
        }

    
}

struct MyButton: View {
    let title: String // 타이틀
    let color: Color
    let action: () -> Void // 액션 클로저
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                Spacer()
            }
            .background(color)
            .cornerRadius(5)
        }
    }
}

struct LoginJoinView_Previews: PreviewProvider {
    static var previews: some View {
        LoginJoinView(viewModel: MainViewModel())
    }
}

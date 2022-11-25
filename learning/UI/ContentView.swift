//
//  ContentView.swift
//  learning
//
//  Created by dfarbanish on 11/24/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    @FocusState private var emailFieldIsFocused
    @FocusState private var passwordFieldIsFocused
    
    var body: some View {
        NavigationStack { 
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Pick-Up")
                        .font(
                            .system(
                                size: 38,
                                weight: .medium,
                                design: .rounded
                            )
                        )
                        .foregroundColor(.white)
                        .padding(100)
                    VStack {
                        TextField(" User Name", text: $viewModel.username)
                            .focused($emailFieldIsFocused)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .padding(4)
                            .border(.primary)
                            .font(
                                .system(
                                    size: 22,
                                    design: .rounded
                                )
                            )
                            .foregroundColor(.white)
                        SecureField(" Password", text: $viewModel.password)
                            .onSubmit {
                                // todo
                            }
                            .focused($passwordFieldIsFocused)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .padding(4)
                            .border(.primary)
                            .font(
                                .system(
                                    size: 22,
                                    design: .rounded
                                )
                            )
                            .foregroundColor(.white)
                    }
                    .padding(20)
                    HStack(spacing: 15) {
                        Text("Sign Up")
                            .padding(15)
                            .background(.gray)
                            .foregroundColor(.white)
                            .font(
                                .system(
                                    size: 22,
                                    design: .rounded
                                )
                            )
                        NavigationLink("Login") {
                            HomeView()
                        }
                        .font(
                            .system(
                                size: 22,
                                design: .rounded
                            )
                        )
                        .padding(15)
                        .foregroundColor(.white)
                        .background(.orange)
                    }
                    Spacer(minLength: 300)
                    Text("Forgot password")
                        .font(.system(size: 14, design: .rounded))
                        .foregroundColor(.blue)
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

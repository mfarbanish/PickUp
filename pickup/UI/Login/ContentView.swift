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
                LinearGradient(gradient: Gradient(colors: [.orange, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Align.")
                        .font(
                            .system(
                                size: 42,
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
                        NavigationLink("Sign Up") {
                            NewAccountView()
                        }
                        .padding(15)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .foregroundColor(.white)
                        .font(
                            .system(
                                size: 22,
                                design: .rounded
                            )
                        )
                        NavigationLink("Login") {
                            HomePageView(accountId: viewModel.accountId)
                        }
                        .font(
                            .system(
                                size: 22,
                                design: .rounded
                            )
                        )
                        .padding(15)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.orange)
                        .disabled(!viewModel.inputsNotEmpty())
                        .simultaneousGesture(TapGesture().onEnded {
                            viewModel.attemptSignIn()
                        }
                        )
                    }
                    .padding([.horizontal, .bottom], 20)
                    if viewModel.loginFailed {
                        FeedbackText(
                            feedback: "Cannot sign in with user name and password"
                        )
                    }
                    if viewModel.signUpInfoInvalid {
                        FeedbackText(feedback: "Add username and password")
                    }
                    Spacer(minLength: 300)
                    Text("Forgot password?")
                        .font(.system(size: 14, design: .rounded))
                        .foregroundColor(.white)
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

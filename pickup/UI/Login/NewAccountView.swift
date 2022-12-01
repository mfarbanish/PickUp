//
//  NewAccountView.swift
//  PickUp
//
//  Created by dfarbanish on 11/27/22.
//

import SwiftUI

struct NewAccountView: View {
    @StateObject private var viewModel = ViewModel()
    @FocusState private var emailFieldIsFocused
    @FocusState private var passwordFieldIsFocused
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.orange, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("Welcome to Align.")
                    .font(
                        .system(
                            size: 42,
                            weight: .medium,
                            design: .rounded
                        )
                    ).foregroundColor(.white)
                VStack {
                    TextField(" User Name", text: $viewModel.inputUserName)
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
                        //.onChange(of: $viewModel.inputUserName) {
                        //    viewModel.usernameWritten()
                        //}
                    SecureField(" Password", text: $viewModel.inputPassword)
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
                        .padding([.bottom], 20)
                        //.onChange(of: $viewModel.inputPassword) {
                        //    viewModel.passwordWritten()
                        //}
                    NavigationLink("Create Account") {
                        if viewModel.signUpFailed {
                            ContentView()
                        } else {
                            HomePageView(accountId: viewModel.accountId)
                        }
                    }
                    .disabled(!viewModel.canAttemptAccount())
                    .simultaneousGesture(TapGesture().onEnded {
                        viewModel.attemptToCreateAccount()
                    }
                    )
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
                    if viewModel.usernameInvalid {
                        FeedbackText(feedback: "username is taken")
                    }
                    if viewModel.passwordInvalid {
                        FeedbackText(feedback: "Password must be > 8 characters")
                    }
                    if viewModel.signUpInfoInvalid {
                        FeedbackText(feedback: "Can't create an account with invalid info")
                    }
                }
                .padding([.horizontal], 20)
                Spacer()
            }
        }
    }
}

struct NewAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NewAccountView()
    }
}

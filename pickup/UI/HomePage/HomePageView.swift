//
//  HomeView.swift
//  learning
//
//  Created by dfarbanish on 11/24/22.
//

import SwiftUI

struct HomePageView: View {
    let accountId: String
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.orange, .blue, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .orange))
            } else {
                NavigationStack {
                    Grid {
                        ForEach(viewModel.models ?? []) { model in
                            GridRow {
                                SportBageView(model: model)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static let accountId = "accountId"
    
    static var previews: some View {
        HomePageView(accountId: accountId)
    }
}

struct SportBageView: View {
    var model: SportBadgeModel
    var body: some View {
        NavigationStack {
            VStack {
                Image(model.imageUrl)
                NavigationLink(model.name) {
                    EventPlanningView(userId: model.id)
                }
                .font(
                    .system(
                        size: 22,
                        design: .rounded
                    )
                )
                .foregroundColor(.white)
            }
            .padding(30)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [.black, .orange]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing))
            .edgesIgnoringSafeArea(.all)
            .padding(10)
        }
    }
}

//
//  HomeView.swift
//  learning
//
//  Created by dfarbanish on 11/24/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        if viewModel.isLoading {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct SportBageView: View {
    var model: SportBadgeModel
    var body: some View {
        NavigationStack {
            VStack {
                Image(model.imageUrl)
                NavigationLink(model.name) {
                    SportDetailView(id: model.id)
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

//
//  SportDetailView.swift
//  learning
//
//  Created by dfarbanish on 11/25/22.
//

import SwiftUI

struct EventPlanningView: View {
    let userId: String
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        if viewModel.isLoading {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .onAppear() {
                    viewModel.initializeForId(userid: userId)
                }
        } else {
            VStack {
                Text(viewModel.model?.name ?? "error no Name")
                    .padding()
                Text(viewModel.model?.details ?? "error no Details")
            }
        }
    }
}

struct SportDetailView_Previews: PreviewProvider {
    static let id = "soccerId"

    static var previews: some View {
        EventPlanningView(userId: id)
    }
}

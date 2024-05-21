//
//  FlowerListView.swift
//  SwiftUIMVVM
//
//  Created by Pawan Agrahari on 21/05/24.
//

import SwiftUI

struct FlowerListView: View {
    
    let viewModel = FlowerViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(viewModel.flowers.enumerated()), id: \.element.id) { index, flower in
                    NavigationLink {
                        FlowerDetailsView(flowers: viewModel.flowers, index: index)
                    } label: {
                        FlowerRowView(flower: flower)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Flowers")
        }
        .task {
            await viewModel.fetchLists()
        }
    }
}

#Preview {
    FlowerListView()
}

//
//  FlowerRowView.swift
//  SwiftUIMVVM
//
//  Created by Pawan Agrahari on 21/05/24.
//

import SwiftUI

struct FlowerRowView: View {

    let flower: Flower

    var body: some View {
        HStack(spacing: 8) {
            if let url = URL(string: flower.imageUrl) {
                flowerImage(url: url)
            }

            VStack(alignment: .leading, spacing: 8) {
                // Title
                Text(flower.title)
                    .font(.headline)
                    .lineLimit(2)

                // Category and Rating
                HStack {
                    Text(flower.category)
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Spacer()

                    HStack {
                        Image(systemName: "star.fill")

                        Text(flower.rating.rate.toString())
                    }
                    .fontWeight(.medium)
                    .foregroundStyle(.yellow)
                }

                // Description
                Text(flower.description)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .lineLimit(3)

                // Price and Buy Button
                HStack {
                    Text(flower.price.currencyFormat())
                        .font(.title3)
                        .foregroundStyle(.indigo)

                    Spacer()

                    buyButton
                }
            }
        }
        .padding()

    }

    func flowerImage(url: URL) -> some View {
        AsyncImage(url: url) { image in
            image.resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }

    var buyButton: some View {
        Button(action: {}, label: {
            Text("Buy")
                .foregroundStyle(.white)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(.indigo)
                .clipShape(.capsule)
        })
    }
}

#Preview {
    FlowerRowView(flower: Flower.dummy)
}

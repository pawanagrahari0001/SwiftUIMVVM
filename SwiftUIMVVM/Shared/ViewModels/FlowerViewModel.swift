//
//  FlowerViewModel.swift
//  SwiftUIMVVM
//
//  Created by Pawan Agrahari on 21/05/24.
//

import Foundation

@Observable class FlowerViewModel {

    var flowers: [Flower] = []

    func fetchLists() async {
        do {
            self.flowers = try await APIService.shared.fetchData(from: "https://data-pawan-public.s3.amazonaws.com/API's/flowers.json")
            print(flowers)
        } catch {
            print("Fetch Flowers error:", error)
        }
    }
}

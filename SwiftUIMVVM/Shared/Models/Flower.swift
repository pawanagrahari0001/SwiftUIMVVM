//
//  Flower.swift
//  SwiftUIMVVM
//
//  Created by Pawan Agrahari on 21/05/24.
//

import Foundation

struct Flower: Identifiable, Decodable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let imageUrl: String
    let isInStock: Bool?
    let seasonal: Bool?
    let careInstructions: CareInstructions?
    let rating: Rate
    let highlights: [String]?

    
    static var dummy: Flower {
        return Flower(id: 1, 
                      title: "Sunflowers Bunch (Deluxe)",
                      price: 24.99, 
                      description: "A vibrant bunch of 7-10 sunflowers, perfect for a statement piece. Includes filler flowers and decorative wrapping.",
                      category: "Cut Flowers",
                      imageUrl: "https://data-pawan-public.s3.amazonaws.com/API's/Images/sunflower.png",
                      isInStock: true,
                      seasonal: true,
                      careInstructions: CareInstructions(water: "Change water every 2-3 days", light: "Full sun to partial shade"),
                      rating: Rate(rate: 4.8, count: 120),
                      highlights: ["5-7 large, vibrant sunflowers",
                                   "Freshly cut and long-lasting",
                                   "Available in various stem lengths",
                                   "Includes filler flowers and decorative wrapping"]
        )
    }
}

// MARK: - CareInstructions
struct CareInstructions: Codable {
    let water, light: String
}

// MARK: - Rating
struct Rate: Codable {
    let rate: Double
    let count: Int
}

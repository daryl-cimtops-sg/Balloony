//
//  ModelData.swift
//  Balloony
//
//  Created by Wind Versi on 26/5/22.
//

import SwiftUI

class BalloonModelData: ObservableObject {
    
    // UI
    @Published var isMenuShown: Bool = false
    
    @Published var selectedBalloonIdx = 0 {
        didSet {
            // set to default values
            selectedSize = .fiveInch
            quantity = "1"
        }
    }
    @Published var selectedSize: Sizes = .fiveInch
    @Published var quantity = "1"
    
    var selectedBalloon: Balloon {
        balloons[selectedBalloonIdx]
    }
    
    var totalPrice: Double {
        let price = selectedBalloon.price
        guard let quantity = Int(quantity) else {
            return price
        }
        return price * Double(quantity)
    }
    
    // Data
    @Published var balloons: [Balloon] = [
        .init(
            name: "Cosmic",
            gradientColors: [
                .combination5a,
                .combination5b
            ],
            topViewLength: 94
        ),
        .init(
            name: "Saturn",
            price: 101,
            gradientColors: [
                .combination4a,
                .combination4b
            ],
            topViewLength: 201
        ),
        .init(
            name: "Aqua",
            gradientColors: [
                .combination2a,
                .combination2b
            ],
            topViewLength: 115
        ),
        .init(
            name: "Sun",
            gradientColors: [
                .combination3a,
                .combination3b
            ],
            topViewLength: 48
        ),
        .init(
            name: "Unicorn",
            gradientColors: [
                .combination1a,
                .combination1b
            ],
            topViewLength: 86
        )
    ]
    
    // Events
    func showMenu() {
        isMenuShown = true
    }
    
    func hideMenu() {
        isMenuShown = false
    }
    
}

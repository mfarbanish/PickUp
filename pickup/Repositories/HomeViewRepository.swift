//
//  HomeViewRepository.swift
//  learning
//
//  Created by dfarbanish on 11/24/22.
//

import Foundation

class HomeViewRepository {
    
    func getData() -> [SportBadgeModel] {
        do {
            sleep(1)
        }
        return [
            SportBadgeModel(
                id: "soccerId",
                name: "Soccer",
                imageUrl: "",
                memberCount: 109
            ),
            SportBadgeModel(
                id: "footballId",
                name: "Football",
                imageUrl: "",
                memberCount: 201
                
            ),
            SportBadgeModel(
                id: "basketballId",
                name: "Basketball",
                imageUrl: "",
                memberCount: 231
            ),
            SportBadgeModel(
                id: "spikeballId",
                name: "Spikeball",
                imageUrl: "",
                memberCount: 145
            ),
            SportBadgeModel(
                id: "volleyballId",
                name: "Volleyball",
                imageUrl: "",
                memberCount: 123
            )
        ]
    }
}

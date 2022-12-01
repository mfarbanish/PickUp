//
//  SportDetailRepository.swift
//  learning
//
//  Created by dfarbanish on 11/25/22.
//

import Foundation


class HomePageRepository {
    
    func getData(userId: String) -> FullSportInfoModel? {
        do {
            sleep(1)
        }
        let mapping = [
            "soccerId" : FullSportInfoModel(
                id: "soccerId",
                name: "Soccer",
                details: "Soccer is fun",
                locations: []
            ),
            "footballId": FullSportInfoModel(
                id: "footballId",
                name: "Football",
                details: "I love football so muuch",
                locations: []
                
            ),
            "basketballId": FullSportInfoModel(
                id: "basketballId",
                name: "Basketball",
                details: "lets play baseball",
                locations: []
            ),
            "spikeballId": FullSportInfoModel(
                id: "spikeballId",
                name: "Spikeball",
                details: "get the nets out",
                locations: []
            ),
            "volleyballId": FullSportInfoModel(
                id: "volleyballId",
                name: "Volleyball",
                details: "ill spike on you",
                locations: []
            )
        ]
    return mapping[userId]
    }
}

//
//  FullSportDetailModel.swift
//  learning
//
//  Created by dfarbanish on 11/25/22.
//

import Foundation
// TODO update model to support home screen information
struct FullSportInfoModel: Identifiable {
    let id: String
    let name: String
    let details: String
    let locations: [Locale]
}

//
//  SharedUIFunctions.swift
//  PickUp
//
//  Created by dfarbanish on 11/30/22.
//

import Foundation
import SwiftUI

func FeedbackText(feedback: String) -> Text {
    return Text(feedback)
        .font(.system(size: 14, design: .rounded))
        .foregroundColor(.yellow)
}

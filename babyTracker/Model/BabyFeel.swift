//
//  BabyFeel.swift
//  babyTracker
//
//  Created by Eyüphan Akkaya on 11.12.2023.
//

import Foundation

struct BabyFeel {
    let id: String
    let timeOne: String
    let time: String
    let note: String
    let image: String
    let type: String
}
enum IllnessType : String {
    case all = "all"
    case feeding = "feed"
    case sleep = "sleep"
    case symptoms = "symptoms"
}

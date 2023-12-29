//
//  Gloabls.swift
//  babyTracker
//
//  Created by Eyüphan Akkaya on 7.12.2023.
//

import Foundation
import FirebaseAuth
import Firebase

class Globals {
    static let shared = Globals()
    
    var selectedItem = [Symptoms]()
    var allStatus = [BabyFeel]()
    var buyPremiums = false
    var userID = ""

}

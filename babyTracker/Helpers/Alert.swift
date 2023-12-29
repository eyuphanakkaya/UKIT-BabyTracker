//
//  Alert.swift
//  babyTracker
//
//  Created by Eyüphan Akkaya on 15.12.2023.
//

import Foundation
import UIKit

class Alerts {
    static func alertAction(title: String,message: String,vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        vc.present(alert, animated: true)
    }
}

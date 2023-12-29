//
//  BabyStatusManager.swift
//  babyTracker
//
//  Created by Eyüphan Akkaya on 14.12.2023.
//

import Foundation
import UIKit
import Firebase


class BabyStatusManager {
    static func uploadBabyValue(userId: String,timeOne: String,time: String,note: String,image: String,type: String){
        let doctRef =  Firestore.firestore().collection("babyFeel/users/\(userId)").document()
        doctRef.setData([
            "timeOne" : timeOne,
            "time" : time,
            "note" : note,
            "image" : image,
            "type" : type
        ])
    }
    static func fetchBabyValue(userId: String,completion: @escaping()-> Void){
        let doctRef = Firestore.firestore().collection("babyFeel/users/\(userId)")
        doctRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                Globals.shared.allStatus.removeAll()
                NotificationCenter.default.post(name: Notification.Name("baby"), object: nil)
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let documentId = document.documentID
                    guard let timeOne = data["timeOne"] as? String ,
                          let time = data["time"] as? String,
                          let note = data["note"] as? String,
                          let image = data["image"] as? String,
                          let type = data["type"] as? String else{return}
                    let status = BabyFeel(id: documentId, timeOne: timeOne, time: time, note: note, image: image, type: type)
                    
                    Globals.shared.allStatus.append(status)
                    completion()
                }
            }
        }
    }
    static func updateBabyValue(userId: String,documentId: String,timeOne: String,time: String,note: String){
        let doctRef = Firestore.firestore().collection("babyFeel/users/\(userId)").document(documentId)
        let uploadData = [
            "timeOne": timeOne,
            "time": time,
            "note": note
        ]
        
        doctRef.updateData(uploadData) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("updated")
            }
         
        }
        
    }
    static func deleteBabyValue(userId: String,documentId: String,completion: @escaping()-> Void){
        let collectionRef = Firestore.firestore().collection("babyFeel/users/\(userId)")
        let doctRef = collectionRef.document(documentId)
        
        doctRef.delete { error in
            if let error = error {
                print("error : \(error.localizedDescription)")
            } else {
                print("deleted")
                completion()
            }
        }
        
    }
    
}

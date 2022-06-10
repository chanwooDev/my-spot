//
//  SpotController.swift
//  MySpot
//
//  Created by 송현준 on 2022/06/10.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import CoreLocation

class MySpot {
    var key: String = ""
    var address: String = ""
    var name: String = ""
    var sector: String = ""
    var lat: Double = 0.0
    var lng: Double = 0.0
    
    init(lat: Double, lng: Double) {
        self.lat = lat
        self.lng = lng
        let db = Firestore.firestore()
        db.collection("spot").whereField("lat", isEqualTo: lat)
            .whereField("lng", isEqualTo: lng)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        self.key = document.documentID
                        let data = document.data()
                        self.address = data["address"]! as! String
                        self.name = data["name"]! as! String
                        self.sector = data["sector"]! as! String
                    }
                }
            }
    }
}


func getNears(startLat: String, endLat: String, startLng: String, endLng: String){
    let db = Firestore.firestore()
    var latSet: [MySpot] = [] // 경도 범위 내에 있는 좌표
    MySpots = []
    db.collection("spot").whereField("lat", isGreaterThan: startLat)
        .whereField("lat", isLessThan: endLat)
        .getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                
                for document in querySnapshot!.documents {
                    let data = document.data()
                    //print(data)
                    latSet.append(MySpot(lat: Double(data["lat"] as! Substring)!, lng: Double(data["lng"] as! Substring)!))
                }
                
                for pos in latSet{
                    if Double(startLng)! <= pos.lng && pos.lng <= Double(endLng)!{
                        MySpots.append(pos)
                        print(pos.lat)
                        print(pos.lng)
                    }
                }
            }
            
        }

    
}

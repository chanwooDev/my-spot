//
//  MySpots.swift
//  MySpot
//
//  Created by 송현준 on 2022/06/08.
//

import SwiftUI
import GoogleMaps

var MySpotsLocation: [CLLocationCoordinate2D] = []
var FriendSpotsLocation: [CLLocationCoordinate2D] = []
var SpotsLocation: [CLLocationCoordinate2D] = []

var MySpots: [MySpot] = []

var MyPinnedSpots: [MySpot] = [
    MySpot(lat: Double("35.8925113764702")!, lng: Double("128.608949843255")!),
    MySpot(lat: Double("35.8926307381211")!, lng: Double("128.609087257873")!),
    MySpot(lat: Double("35.8926317951414")!, lng: Double("128.607777268474")!)
]

var MyFriendSpots: [MySpot] = [
    MySpot(lat: Double("35.8925113764702")!, lng: Double("128.608949843255")!),
    MySpot(lat: Double("35.8926259411766")!, lng: Double("128.608301863171")!),
    MySpot(lat: Double("35.8926269742443")!, lng: Double("128.607928671091")!),
    MySpot(lat: Double("35.8926307381211")!, lng: Double("128.609087257873")!),
    MySpot(lat: Double("35.8926317951414")!, lng: Double("128.607777268474")!)
]


func markSpotsLocation1(map: GMSMapView){
    print("Happy!!")
    for spotLoc in MySpots{
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: spotLoc.lat, longitude: spotLoc.lng)
        marker.icon = GMSMarker.markerImage(with: .gray)
        marker.map = map
    }
}

func markSpotsLocation2(map: GMSMapView){
    print("Happy!!")
    for spotLoc in MyPinnedSpots{
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: spotLoc.lat, longitude: spotLoc.lng)
        marker.icon = GMSMarker.markerImage(with: .red)
        marker.map = map
    }
}

func markSpotsLocation3(map: GMSMapView){
    print("Happy!!")
    for spotLoc in MyFriendSpots{
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: spotLoc.lat, longitude: spotLoc.lng)
        marker.icon = GMSMarker.markerImage(with: .blue)
        marker.map = map
    }
}


func curSpot(lat: Double, lng: Double) -> MySpot{
    for i in MySpots{
        if i.lat == lat && i.lng == lng{
            print(i.name)
            return i
        }
    }
    print("suicide")
    return MySpot(lat: 0, lng: 0)
}



//func addMySpot(map: GMSMapView, SpotDataArray: inout [GMSMarker], coor: CLLocationCoordinate2D, color: UIColor){
//    let marker = GMSMarker()
//    marker.position = coor
//    marker.icon = GMSMarker.markerImage(with: color)
//    marker.map = map
//
//
//    SpotDataArray.append(marker)
//}
//


//func addMySpot(_ newSpot :Spot, map: GMSMapView, SpotDataArray: inout [GMSMarker]){
//    let marker = GMSMarker()
//    marker.position = newSpot.position
//    marker.icon = GMSMarker.markerImage(with: newSpot.color)
//    marker.map = map
//
//
//    SpotDataArray.append(marker)
//}


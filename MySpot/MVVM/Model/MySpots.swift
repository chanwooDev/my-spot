//
//  MySpots.swift
//  MySpot
//
//  Created by 송현준 on 2022/06/08.
//

import SwiftUI
import GoogleMaps

var MySpots: [GMSMarker] = []
var FriendSpots: [GMSMarker] = []
var Spots: [GMSMarker] = []

func tempInitFunc(map: GMSMapView, SpotDataArray: inout [GMSMarker]){
    
    addMySpot(
        Spot(position: CLLocationCoordinate2D(latitude: 35.891, longitude: 128.611), color: .red),
        map: map,
        SpotDataArray: &SpotDataArray
    )
    
    addMySpot(
        Spot(position: CLLocationCoordinate2D(latitude: 35.889, longitude: 128.611), color: .red),
        map: map,
        SpotDataArray: &SpotDataArray
    )

    addMySpot(
        Spot(position: CLLocationCoordinate2D(latitude: 35.889, longitude: 128.609), color: .red),
        map: map,
        SpotDataArray: &SpotDataArray
    )
}

func addMySpot(_ newSpot :Spot, map: GMSMapView, SpotDataArray: inout [GMSMarker]){
    let marker = GMSMarker()
    marker.position = newSpot.position
    marker.icon = GMSMarker.markerImage(with: newSpot.color)
    marker.map = map
    
    
    SpotDataArray.append(marker)
}

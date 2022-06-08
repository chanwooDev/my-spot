//
//  MySpots.swift
//  MySpot
//
//  Created by 송현준 on 2022/06/08.
//

import SwiftUI
import GoogleMaps

var MySpots: [GMSMarker] = []

func tempInitFunc(map: GMSMapView){
    addMySpot(CLLocationCoordinate2D(), map: <#T##GMSMapView#>)
}

func addMySpot(_ newSpot :Spot, map: GMSMapView){
    let marker = GMSMarker()
    marker.position = newSpot.position
    marker.icon = GMSMarker.markerImage(with: newSpot.color)
    marker.map = map
    
    MySpots.append(marker)
}

//
//  locationManager.swift
//  MySpot
//
//  Created by 송현준 on 2022/06/08.
//

import GoogleMaps
import SwiftUI
import UIKit

let curlocationManager = CLLocationManager()

func getLocation() -> CLLocationCoordinate2D?{
    guard let locValue: CLLocationCoordinate2D = curlocationManager.location?.coordinate else {
        curlocationManager.requestAlwaysAuthorization()
        return nil
    }
    return locValue
}

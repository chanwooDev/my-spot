//
//  ContentView.swift
//  MySpot
//
//  Created by 송현준 on 2022/05/11.
//

import SwiftUI

import GoogleMaps
import GooglePlaces

struct ContentView: View {
    
    var body: some View {
        MainPage()
    }
}

//app dedelegate part
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        GMSServices.provideAPIKey("AIzaSyB--63e9h10Slq6zGznQ7elXbKac4nj5EE")
        GMSPlacesClient.provideAPIKey("AIzaSyB--63e9h10Slq6zGznQ7elXbKac4nj5EE")
        return true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

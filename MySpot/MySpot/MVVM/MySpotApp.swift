//
//  MySpotApp.swift
//  MySpot
//
//  Created by 송현준 on 2022/05/11.
//

import SwiftUI

@main
struct MySpotApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

//
//  MainPage_Map.swift
//  MySpot
//
//  Created by 송현준 on 2022/05/25.
//

import SwiftUI
import GoogleMaps


struct MainPage_Map: View{
    
    @State var curViewSelect = viewSelect.MySpots
    @State var showPopUp: Bool = false
    @State var currentSpot = MySpot(lat: 0, lng: 0)
    @State var tappedSpot: GMSMarker{
        didSet(newValue){
            currentSpot = curSpot(lat: newValue.position.latitude, lng: newValue.position.longitude)
        }
    }
    @State var ifUpdated: Bool = false

    @Binding var isSlideOn: Bool

    var body: some View{
        GeometryReader{ geometry in
            ZStack(alignment: .top){
                VStack(spacing: 0){
                    HStack(alignment: .center){
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: geometry.size.width*0.1, height: geometry.size.width*0.1)
                            .onTapGesture {
                                isSlideOn = true
                            }
                        
                        Spacer()
                        
                        HStack(spacing: 0){
                            Text("내 스팟")
                                .padding(10)
                                .font(.system(size: 18))
                                .foregroundColor(curViewSelect == .MySpots ? .white : appColor)
                                .background(curViewSelect == .MySpots ? appColor : .white)
                                .cornerRadius(25, corners: [.topLeft, .bottomLeft])
                                .onTapGesture {
                                    curViewSelect = .MySpots
                                }
                            
                            Text("친구 스팟")
                                .padding(10)
                                .font(.system(size: 18))
                                .foregroundColor(curViewSelect == .FriendSpots ? .white : appColor)
                                .background(curViewSelect == .FriendSpots ? appColor : .white)
                                .onTapGesture {
                                    curViewSelect = .FriendSpots
                                }

                            Text("전체 스팟")
                                .padding(10)
                                .font(.system(size: 18))
                                .foregroundColor(curViewSelect == .Spots ? .white : appColor)
                                .background(curViewSelect == .Spots ? appColor : .white)
                                .cornerRadius(25, corners: [.topRight, .bottomRight])
                                .onTapGesture {
                                    curViewSelect = .Spots
                                }
                        }
                        .shadow(radius: 5)

                    }
                    .padding(geometry.size.width * 0.04)
                    .frame(width: geometry.size.width, height: geometry.size.height / 8)
                    .background(.white)
                    
                    switch curViewSelect {
                    case .Spots:
                        MapViewControllerBridge(showPopUp: $showPopUp, tappedSpot: $tappedSpot, curViewSelect: curViewSelect, ifUpdated: $ifUpdated)
                    case .MySpots:
                        MapViewControllerBridge(showPopUp: $showPopUp, tappedSpot: $tappedSpot, curViewSelect: curViewSelect, ifUpdated: $ifUpdated)
                    case .FriendSpots:
                        MapViewControllerBridge(showPopUp: $showPopUp, tappedSpot: $tappedSpot, curViewSelect: curViewSelect, ifUpdated: $ifUpdated)

                    }
                }
                
                ifUpdated ? nil : Image(systemName: "arrow.clockwise.circle.fill")
                    .foregroundColor(appColor)
                    .background(Color.white)
                    .cornerRadius(100)
                    .font(.system(size: 40))
                    .shadow(radius: 10)
                    .padding(.top, geometry.size.height / 7)
                    .onTapGesture {
                        ifUpdated = true
                        getNears(startLat: "35.892492", endLat: "35.893625", startLng: "128.607698", endLng: "128.610561")
                    }
                
                
                SpotModalView(show: $showPopUp, tappedSpot: $tappedSpot, curSpot: currentSpot)
            }
        }
    }
}


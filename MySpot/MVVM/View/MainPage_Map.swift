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
    @State var tappedSpot: GMSMarker = GMSMarker()
    @State var ifUpdated: Bool = false


    var body: some View{
        GeometryReader{ geometry in
            ZStack(alignment: .top){
                VStack(spacing: 0){
                    HStack(alignment: .center){
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: geometry.size.width*0.1, height: geometry.size.width*0.1)
                        
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
                    
                    MapViewControllerBridge(showPopUp: $showPopUp, tappedSpot: $tappedSpot, curViewSelect: curViewSelect, ifUpdated: $ifUpdated)
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
                    }
                
                SpotModalView(show: $showPopUp, tappedSpot: $tappedSpot)
            }
        }
    }
}

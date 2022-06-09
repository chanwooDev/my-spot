//
//  MainPage_Map.swift
//  MySpot
//
//  Created by 송현준 on 2022/05/25.
//

import SwiftUI

struct MainPage_Map: View{
    
    @State var ifSpotStateMySpot = true

    var body: some View{
        GeometryReader{ geometry in
            
            VStack(spacing: 0){
                HStack(alignment: .center){
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: geometry.size.width*0.1, height: geometry.size.width*0.1)
                    
                    Spacer()
                    
                    HStack(spacing: 0){
                        Text("내 스팟")
                            .padding(10)
                            .font(.system(size: 20))
                            .foregroundColor(ifSpotStateMySpot ? .white : appColor)
                            .background(ifSpotStateMySpot ? appColor : .white)
                            .cornerRadius(25, corners: [.topLeft, .bottomLeft])
                            .shadow(radius: 5)
                            .onTapGesture {
                                ifSpotStateMySpot = true
                            }
                        
                        Text("친구 스팟")
                            .padding(10)
                            .font(.system(size: 20))
                            .foregroundColor(ifSpotStateMySpot ? appColor : .white)
                            .background(ifSpotStateMySpot ? .white : appColor)
                            .cornerRadius(25, corners: [.topRight, .bottomRight])
                            .shadow(radius: 5)
                            .onTapGesture {
                                ifSpotStateMySpot = false
                            }

                    }
                }
                .padding(geometry.size.width * 0.04)
                .frame(width: geometry.size.width, height: geometry.size.height / 8)
                .background(.white)
                
                MapViewControllerBridge()
            }
            
        }
    }
}

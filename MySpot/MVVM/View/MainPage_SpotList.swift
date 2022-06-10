//
//  MainPage_SpotList.swift
//  MySpot
//
//  Created by 송현준 on 2022/05/31.
//

import SwiftUI

struct MainPage_SpotList: View{
    
    @Binding var screenNum: MainScreen
    @Binding var showPopUp: Bool

    
    var body: some View{
        GeometryReader{ geometry in
            VStack(spacing: 0){
                VStack{
                    Text("MYSPOT")
                        .font(.system(size: 15))
                        .foregroundColor(appColor)
                        .frame(width: geometry.size.width * 0.95, alignment: .leading)
                    
                    Text("내 스팟 목록")
                        .font(.system(size: 30))
                        .frame(width: geometry.size.width * 0.95, alignment: .leading)
                }
                .frame(width: geometry.size.width, height: geometry.size.height / 8)
                .background(.white)
                
                Spacer()
                
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                    VStack{
//                        SpotInfoView(spotName: "박준오 선산곱창")
//                        SpotInfoView(spotName: "고기굽는남자")
//                        SpotInfoView(spotName: "면탐정")

                        SpotInfoView(spotName: "박준오 선산곱창", imageName: "gop")
                            .onTapGesture {
                                showPopUp = true
                                screenNum = .map
                            }
                        SpotInfoView(spotName: "고기굽는남자", imageName: "sam")
                        SpotInfoView(spotName: "면탐정", imageName: "meon")
                        Spacer()
                    }
                }.frame(height: 600)
                
                Spacer()
            }
        }
    }
    
}

struct SpotInfoView: View{
    var spotName: String
    var imageName: String
    
    var body: some View{
        ZStack{
            Rectangle()
                .foregroundColor(.white)
            HStack {
                Image(uiImage: UIImage(named: imageName)!)
                    .resizable()
                    .frame(width: 50, height: 50)
                Text(spotName)
                    .padding(.leading, 10.0)
                    .font(.system(size: 25))
                Spacer()
            }
            .padding(.leading, 20.0)
        }
        .foregroundColor(.black)
        .frame(height: 50)
    }
}

//
//  MainPage_SpotList.swift
//  MySpot
//
//  Created by 송현준 on 2022/05/31.
//

import SwiftUI

struct MainPage_SpotList: View{
    
    var body: some View{
        GeometryReader{ geometry in
            VStack{
                VStack{
                    Text("MYSPOT")
                        .font(.system(size: 15))
                        .foregroundColor(.mint)
                        .frame(width: geometry.size.width * 0.95, alignment: .leading)
                    
                    Text("내 스팟 목록")
                        .font(.system(size: 30))
                        .frame(width: geometry.size.width * 0.95, alignment: .leading)
                }
                .frame(width: geometry.size.width, height: geometry.size.height / 8)
                .background(.white)
                
                Spacer()
                
                HStack{
                    Text("SpotList")
                        .font(.system(size: 50))
                }
                
                Spacer()
            }
        }
    }
    
}

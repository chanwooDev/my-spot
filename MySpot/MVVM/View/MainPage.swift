//
//  MainPage.swift
//  MySpot
//
//  Created by 송현준 on 2022/05/25.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import GoogleMaps

struct MainPage: View{
    
    @State private var screenNum = MainScreen.map
    @State var isSlideOn: Bool = false
    @State var isClickedAddFriendButton: Bool = false
    @State var showPopUp: Bool = false
    
    var body: some View{
        GeometryReader{ geometry in
            ZStack{
                VStack(spacing: 0){
                    switch(screenNum){
                    case .map:
                        MainPage_Map( showPopUp: showPopUp, tappedSpot: GMSMarker(), isSlideOn: $isSlideOn)
                    case .spotList:
                        MainPage_SpotList(screenNum: $screenNum, showPopUp: $showPopUp)
                    }
                    
                    HStack{
                        switch(screenNum){
                        case .map:
                            Text("지도")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(appColor)
                                .shadow(radius: 5)
                                .frame(width: geometry.size.width * 0.5, height: geometry.size.height / 8)
                                .onTapGesture {
                                    screenNum = .map
                                }
                            Divider()
                                .frame(width: 1, height: geometry.size.height / 9.2)
                                .background(appColor)
                            Text("스팟 목록")
                                .font(.system(size: 30))
                                .foregroundColor(.gray)
                                .frame(width: geometry.size.width * 0.5, height: geometry.size.height / 8)
                                .onTapGesture {
                                    screenNum = .spotList
                                    let db = Firestore.firestore()
                                    db.collection("user").whereField("email", isEqualTo: "test")
                                        .getDocuments() { (querySnapshot, err) in
                                            if let err = err {
                                                print("Error getting documents: \(err)")
                                            } else {
                                                for document in querySnapshot!.documents {
                                                    let data = document.data()
                                                    print(data["spots"]!)
                                                }
                                            }
                                            
                                        }
                                }
                        case .spotList:
                            Text("지도")
                                .font(.system(size: 30))
                                .foregroundColor(.gray)
                                .frame(width: geometry.size.width * 0.5, height: geometry.size.height / 8)
                                .onTapGesture {
                                    screenNum = .map
                                }
                            Divider()
                                .frame(width: 1, height: geometry.size.height / 9.2)
                                .background(appColor)
                            Text("스팟 목록")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(appColor)
                                .shadow(radius: 5)
                                .frame(width: geometry.size.width * 0.5, height: geometry.size.height / 8)
                                .onTapGesture {
                                    screenNum = .spotList
                                }
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height / 8)
                    .background(.white)
                    .shadow(radius: 10)
                }
                
                HStack(spacing: 0){
                    if isSlideOn {
                        SlideView(isSlideOn: $isSlideOn, isClickedAddFriendButton: $isClickedAddFriendButton)
                    }
                    if isClickedAddFriendButton {
                        AddFriendView(isSlideOn: $isSlideOn, isClickedAddFriendButton: $isClickedAddFriendButton)
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            .background(appColor)
        }
    }
    
    
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

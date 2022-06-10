//
//  SlideBarView.swift
//  MySpot
//
//  Created by 최윤석 on 2022/06/10.
//

import SwiftUI

struct AddFriendView: View{
    @State var friendID : String = ""
    @Binding var isSlideOn: Bool
    @Binding var isClickedAddFriendButton: Bool
    var body: some View{
        GeometryReader{ geometry in
            ZStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                    VStack{
                        HStack{
                            Text("친구 ID")
                                .padding(.leading, 15)
                                .foregroundColor(.black)
                            Spacer()
                            CloseAddingFriendViewButton(isSlideOn: $isSlideOn, isClickedAddFriendButton: $isClickedAddFriendButton)
                        }
                        TextField("친구 ID 입력하기", text: $friendID)
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                        Spacer()
                        AddingFriendButton(my: friendID)
                    }
                }
                .frame(width: 250, height: 130)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 0.6))
        }
    }
}

struct CloseAddingFriendViewButton: View{
    @Binding var isSlideOn: Bool
    @Binding var isClickedAddFriendButton: Bool
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
            Text("X")
                .foregroundColor(.black)
        }
        .frame(width: 30, height: 30)
        .onTapGesture {
            isSlideOn = true
            isClickedAddFriendButton = false
        }
    }
}

struct AddingFriendButton: View{
    var my: String
    var body: some View{
        VStack{
            Divider()
                .frame(width: 250, height: 1)
                .background(Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.5))
            Text("친구 추가")
                .foregroundColor(.black)
        }.onTapGesture {
            // 친구 추가 누를 떄
            print(my)
        }
        .frame(height: 50)
    }
}

struct SlideView: View{
    @Binding var isSlideOn: Bool
    @Binding var isClickedAddFriendButton: Bool
    var body: some View{
        GeometryReader{ geometry in
            HStack(spacing: 0){
                VStack{
                    Text("친구 목록")
                        .foregroundColor(.black)
                        .fontWeight(.heavy)
                    ShowingFriendView(name: "짱구", color: Color.yellow)
                    ShowingFriendView(name: "훈이", color: Color.mint)
                    ShowingFriendView(name: "철수", color: Color.blue)
                    ShowingFriendView(name: "유리", color: Color.pink)
                    Spacer()
                    GoToAddFriendButton()
                        .onTapGesture {
                            isClickedAddFriendButton = true
                            isSlideOn = false
                            print(isClickedAddFriendButton)
                        }
                }
                .frame(width: geometry.size.width * 0.7, height: geometry.size.height)
                .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                
                VStack{
                    Spacer()
                }
                .frame(width: geometry.size.width * 0.7, height: geometry.size.height)
                .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 0.6))
                .onTapGesture {
                    isSlideOn = false
                }
            }
        }
    }
        
}

struct GoToAddFriendButton: View{
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 100, height: 40.0)
                .foregroundColor(.blue)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 1)
                )
            Text("친구 추가")
                .fontWeight(.heavy)
        }
    }
}

struct ShowingFriendView: View{
    let name: String
    let color: Color
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 40.0)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 1)
                )
            HStack{
                Image(systemName: "person.circle.fill")
                Text(name)
                    .foregroundColor(.black)
                    .fontWeight(.heavy)
                Spacer()
                Image(systemName: "location.north.fill")
                    .rotationEffect(.degrees(180))
                    .foregroundColor(color)
            }
            .padding(.horizontal)
        }
        .frame(width: 200)
    }
}

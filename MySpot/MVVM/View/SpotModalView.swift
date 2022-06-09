
import SwiftUI
import GoogleMaps

struct SpotModalView: View{
    
    @Binding var show: Bool
    @Binding var tappedSpot: GMSMarker
    let name: String = ""
    let address: String = ""
    let phNum: String = ""
    
    var body: some View{
        GeometryReader{ geometry in
        
            ZStack {
                if show {
                    // PopUp background color
                    Color.black.opacity(show ? 0.3 : 0).edgesIgnoringSafeArea(.all)

                    // PopUp Window
                    VStack(alignment: .leading, spacing: 0) {
                        HStack{
                            Text(name)
                                .font(.system(size: 30))
                            Spacer()
                            Button(action: {
                                // Dismiss the PopUp
                                withAnimation(.linear(duration: 0.3)) {
                                    show = false
                                }
                            }, label: {
                                Image(systemName: "xmark")
                                    .font(.system(size: 30))
                                    .foregroundColor(appColor)
                            }).buttonStyle(PlainButtonStyle())
                        }
                        .padding(geometry.size.width * 0.04)
                        
                        Spacer()
                        
                        VStack(alignment: .leading){
                            Image(systemName: "icloud.slash")
                                .frame(maxWidth: geometry.size.width * 0.8, maxHeight: geometry.size.height * 0.2)
                            Text("주소")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .opacity(0.5)
                            Text(address)
                            Text("전화번호")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .opacity(0.5)
                            Text(phNum)
                        }
                        .padding(geometry.size.width * 0.04)
                        
                        Spacer()
                        
                        HStack(alignment: .center){
                            Text("내 스팟에 추가")
                                .font(.system(size: 25))
                                .bold()
                                .foregroundColor(appColor)
                        }
                        .frame(maxWidth: geometry.size.width * 0.8, maxHeight: geometry.size.height * 0.07)
                        .border(Color.gray, width: 1)
                    }
                    .frame(maxWidth: geometry.size.width * 0.8, maxHeight: geometry.size.height * 0.5)
                    .background(.white)
                    .cornerRadius(CGFloat(20))
                }
            }
        }
    }
    
}


struct PopUpWindow: View {
    var title: String
    var message: String
    var buttonText: String
    @Binding var show: Bool

    var body: some View {
        ZStack {
            if show {
                // PopUp background color
                Color.black.opacity(show ? 0.3 : 0).edgesIgnoringSafeArea(.all)

                // PopUp Window
                VStack(alignment: .center, spacing: 0) {
                    Text(title)
                        .frame(maxWidth: .infinity)
                        .frame(height: 45, alignment: .center)
                        .font(Font.system(size: 23, weight: .semibold))
                        .foregroundColor(Color.white)
                        .background(Color(#colorLiteral(red: 0.6196078431, green: 0.1098039216, blue: 0.2509803922, alpha: 1)))

                    Text(message)
                        .multilineTextAlignment(.center)
                        .font(Font.system(size: 16, weight: .semibold))
                        .padding(EdgeInsets(top: 20, leading: 25, bottom: 20, trailing: 25))
                        .foregroundColor(Color.white)

                    Button(action: {
                        // Dismiss the PopUp
                        withAnimation(.linear(duration: 0.3)) {
                            show = false
                        }
                    }, label: {
                        Text(buttonText)
                            .frame(maxWidth: .infinity)
                            .frame(height: 54, alignment: .center)
                            .foregroundColor(Color.white)
                            .background(Color(#colorLiteral(red: 0.6196078431, green: 0.1098039216, blue: 0.2509803922, alpha: 1)))
                            .font(Font.system(size: 23, weight: .semibold))
                    }).buttonStyle(PlainButtonStyle())
                }
                .frame(maxWidth: 300)
                .border(Color.white, width: 2)
                .background(Color(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1)))
            }
        }
    }
}
 
/*
struct tempContentView: View {
    @State private var showPopUp: Bool = false

    init() {
        UINavigationBar.appearance().barTintColor = UIColor(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1))
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
    }

    var body: some View {
        ZStack {
            NavigationView {
                ZStack(alignment: .center) {
                    Color(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1)).ignoresSafeArea()
                    Button(action: {
                        withAnimation(.linear(duration: 1)) {
                            showPopUp.toggle()
                        }
                    }, label: {
                        Text("Show PopUp Window")
                    })
                        .padding()
                        .background(Color(#colorLiteral(red: 0.6196078431, green: 0.1098039216, blue: 0.2509803922, alpha: 1)))
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("PopUpWindowSwiftUIExample")
                .foregroundColor(Color.white)
            }
            
            SpotModalView(show: $showPopUp, name: "박순오 선상곱창", address: "대구 동구 평화로 8-1", phNum: "010-6810-9801")
        }
    }
}

struct PopUpWindow_Previews: PreviewProvider {
    static var previews: some View {
        tempContentView()
    }
}
*/

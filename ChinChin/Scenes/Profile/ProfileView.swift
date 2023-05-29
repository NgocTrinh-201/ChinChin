//
//  ProfileView.swift
//  ChinChin
//
//  Created by Zien on 25/05/2023.
//

import SwiftUI

struct ProfileView: View {
    let tabItems = ["Timeline", "Wallet", "Collectibles", "VC", "Like"]
    // MARK: state
    @State var tabChoose = "Wallet"
    @State var tabSelected = 1
}

extension ProfileView {
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                TabView(selection: $tabSelected) {
                            profile
                            .rotationEffect(.degrees(-90)) // Rotate content
                            .frame(
                                width: proxy.size.width,
                                height: proxy.size.height
                            )
                            .tag(1)
                            activities
                            .rotationEffect(.degrees(-90)) // Rotate content
                            .frame(
                                width: proxy.size.width,
                                height: proxy.size.height
                            )
                            .tag(2)
                        }
                        .frame(
                            width: proxy.size.height, // Height & width swap
                            height: proxy.size.width
                        )
                        .rotationEffect(.degrees(90), anchor: .topLeading) // Rotate TabView
                        .offset(x: proxy.size.width) // Offset back into screens bounds
                        .tabViewStyle(
                            PageTabViewStyle(indexDisplayMode: .never)
                        )
                    }
        }
        .background(.black)
    }
}
extension ProfileView {
    func hederIcon(img: String, text: String, text2: String) -> some View {
        VStack(spacing: 2) {
            Image(img)
                .resizable()
                .foregroundColor(.white)
                .frame(maxWidth: 19, maxHeight: 19)
            Text(text)
                .font(.SFProDisplayRegular(size: 16))
                .foregroundColor(.white)
                .fontWeight(.bold)
            Text(text2)
                .font(.SFProDisplayRegular(size: 16))
                .foregroundColor(.gray.opacity(0.36))
                .fontWeight(.regular)
        }
    }
    func textIcon(img: String, text: String, paddingLead: Double, paddingTrail: Double) -> some View {
        HStack {
            Image(img)
                .resizable()
                .frame(width: 18, height: 18)
                .mask(Circle())
            Text(text)
                .font(.SFProTextMedium(size: 13))
                .foregroundStyle(LinearGradient(colors: [Color("pink1"), Color("blue1")], startPoint: .top, endPoint: .bottom))
        }
        .frame(height: 28)
        .padding(.vertical, 5)
        .padding(.horizontal, 3)
        .padding(.leading, paddingLead)
        .padding(.trailing, paddingTrail)
        .background(Color("profile"))
        .cornerRadius(115)
    }
}

extension ProfileView {
    var heder: some View {
        HStack {
            HStack {
                Image(systemName: "bolt.fill")
                    .foregroundColor(.white)
                Text("2 day")
                    .font(.SFProTextMedium(size: 14))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .background(.gray.opacity(0.36))
            .cornerRadius(24)
            .padding(.leading, 10)
            Spacer()
            HStack(spacing: 7) {
                Text("Edit Profile")
                    .font(.SFProTextMedium(size: 14))
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 6)
                    .background(.gray.opacity(0.36))
                    .cornerRadius(24)
                Image(systemName: "ellipsis")
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .frame(width: 30, height: 34)
                    .background(.gray.opacity(0.36))
                    .mask(Circle())
            }
        }
    }
    var content: some View {
        ZStack {
            VStack(spacing: 45) {
              Spacer(minLength: 70)
               Spacer()
                    VStack(spacing: 20) {
                        VStack(spacing: 10) {
                            HStack(spacing: 7.5) {
                                Text("Donald Minion")
                                    .foregroundColor(.white)
                                    .font(.SFProDisplayHeavy(size: 26))
                                Image("protect")
                            }
                            .padding(.leading, 30)
                            Image("Group1")
                                .resizable()
                                .frame(width: 171, height: 19)
                            HStack(spacing: 5) {
                               textIcon(img: "green", text: "yozixyz.lens", paddingLead: 15, paddingTrail: 12)
                                textIcon(img: "house", text: "yozixyz", paddingLead: 9, paddingTrail: 9)
                                textIcon(img: "blue", text: "yozixyz.eth", paddingLead: 17, paddingTrail: 16)
                            }
                            .padding(.leading, 5)
                        }
                            VStack(alignment: .leading, spacing: 10) {
                                Text("LIFETIME PREMIUM SNAPCHAT‼️ Content of ALL genres🥵 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut 🎉")
                                    .font(.system(size: 12.5))
                                    .foregroundColor(.gray.opacity(0.53))
                                Text("timelesswallet.xyz")
                                    .font(.SFProDisplayRegular(size: 12))
                                    .foregroundColor(Color("pink"))
                            }
                            .padding(.horizontal, 40)
                    }
                button
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .background(.linearGradient(Gradient(colors: [Color.white.opacity(0), .black.opacity(0.7), .black.opacity(1), Color("profile")]), startPoint: .top, endPoint: .bottom))
    }
    var button: some View {
        HStack(spacing: 16) {
            HStack {
                Image("snow 1")
                    .foregroundColor(.white)
                    .frame(width: 14, height: 14)
                Text("Follow")
                    .font(.SFProDisplayRegular(size: 12))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: 28)
            .padding(.vertical, 8)
            .background(Color("profile").opacity(0.5))
            .cornerRadius(15)
            HStack {
                Image(systemName: "chevron.down")
                    .frame(width: 10, height: 5)
                    .onTapGesture {
                        self.tabSelected = 2
                    }
            }
            .frame(maxWidth: 30, maxHeight: 20)
            .foregroundColor(.white)
            .font(.sfProDisplayBold(size: 14))
            .padding(8)
            .background(Color("profile").opacity(0.5))
            .cornerRadius(15)
        }
        .frame(maxWidth: .infinity)
        .padding(.leading, 35)
        .padding(.trailing, 23)
    }
    var profile: some View {
        ZStack(alignment: .top) {
            Image("Bitmap")
               .resizable()
               .scaledToFit()
            VStack {
                heder
                    .padding(.horizontal, 26)
                    .padding(.top, 15)
                    .padding(.bottom, 17)
                HStack {
                    Spacer()
                    VStack(spacing: 18) {
                        hederIcon(img: "cat", text: "7", text2: "Flower")
                        hederIcon(img: "snow 1", text: "22", text2: "Flowings")
                    }
                }
                .padding(.trailing, 14)
                Spacer(minLength: 75)
                content
            }

        }
        .background(.black)
    }
    func tabBarItem(_ text: String, _ selected: Bool = false) -> some View {
        VStack(spacing: 0) {
            Text(text)
                .font(.SFProDisplayRegular(size: 16))
                .fontWeight(.bold)
                .foregroundColor(selected ? .white : .gray)
            if selected {
                Color.white
                .frame(width: 50, height: 2)
                .clipShape(Capsule())
            }
        }
    }
    var tabBar: some View {
        VStack(spacing: 20) {
            ZStack {
            }
            .frame(width: UIScreen.main.bounds.width, height: 12)
            .background(Color("profile"))
            ScrollView(.horizontal) {
                HStack(spacing: 33) {
                    ForEach(self.tabItems, id: \.self) { value in
                        tabBarItem(value, self.tabChoose == value)
                            .onTapGesture {
                                self.tabChoose = value
                            }
                    }
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width)
    }
    var activities: some View {
        VStack {
            tabBar
            WalletActivities()
        }
    }
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

// extension Double {
//    var spSize: Double {
//        self * (UIScreen.main.bounds.width / 3) / 100
//    }
// }

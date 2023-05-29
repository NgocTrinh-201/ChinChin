//
//  ProfileView2.swift
//  ChinChin
//
//  Created by Do Trinh on 28/05/2023.
//

import SwiftUI

//MARK: propepties
struct ProfileView2: View {
    let tabItems = ["Timeline", "Wallet", "Collectibles", "VC", "Like", "Timeline 1", "Wallet 1", "Collectibles 1", "VC 1", "Like 1"]
    @State var tabChoose = "Wallet"
}
//MARK: body
extension ProfileView2 {
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                profile
                activities
            }
        }
        .background(Color("Background"))
    }
}

//MARK: subview
extension ProfileView2 {
    var profile: some View {
        ZStack(alignment: .top) {
            Image("Dona")
               .resizable()
               .scaledToFill()
               .frame(width: UIScreen.main.bounds.width)
               .cornerRadius(20)
            VStack(spacing: 0) {
                //Header
                VStack(alignment: .trailing,spacing: 17) {
                    HStack(spacing: 7) {
                        HStack {
                            Image(systemName: "bolt.fill")
                                .foregroundColor(.white)
                            Text("2 day")
                                .font(.SFProTextMedium(size: 14))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(.gray.opacity(0.36))
                        .cornerRadius(24)
                        Spacer()
                        HStack {
                            Text("Edit profile")
                                .font(.SFProTextMedium(size: 14))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
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
                    .padding(.top, 12)
                    .padding(.leading, 26)
                    .padding(.trailing, 23)
                    VStack(spacing: 17) {
                        hederIcon(img: "🐈", text: "7", text2: "Flower")
                        hederIcon(img: "❋", text: "22", text2: "Flowing")
                    }
                    .padding(.trailing, 14.5)
                }
                Spacer(minLength: 75)
                //Content
                content
            }
        }
    }
    
    var content: some View {
        VStack(spacing: 11) {
            //Scoview
            Spacer(minLength: 140)
            HStack(alignment: .top, spacing: 7.5) {
                VStack(spacing: 9) {
                    Text("Donald Minion")
                        .foregroundColor(.white)
                        .font(.SFProDisplayHeavy(size: 26))
                    HStack(spacing: 21) {
                        Image("twitter")
                        Image("facebook")
                        Image("tiktok")
                        Image("snapchat")
                        Image("linkin")
                    }
                }
                Image("protect")
            }
            .padding(.trailing, -26)
            ScrollView(.horizontal) {
                HStack(spacing: 5) {
                    HStack(spacing: 4) {
                        Image("green")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .mask(Circle())
                        Text("yozixyz.lens")
                            .font(.SFProTextMedium(size: 13))
                            .foregroundStyle(LinearGradient(colors: [Color("pink1"), Color("blue1")], startPoint: .top, endPoint: .bottom))
                    }
                    .padding(.vertical, 5)
                    .padding(.leading, 11)
                    .padding(.trailing, 12)
                    .background(Color("profile"))
                    .cornerRadius(15)
                    .padding(.leading, 22)
                    
                    HStack(spacing: 4) {
                        Image("house")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .mask(Circle())
                        Text("yozixyz")
                            .font(.SFProTextMedium(size: 13))
                            .foregroundStyle(LinearGradient(colors: [Color("pink1"), Color("blue1")], startPoint: .top, endPoint: .bottom))
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal, 9)
                    .background(Color("profile"))
                    .cornerRadius(15)
                    
                    HStack(spacing: 4) {
                        Image("blue")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .mask(Circle())
                        Text("yozixyz.eth")
                            .font(.SFProTextMedium(size: 13))
                            .foregroundStyle(LinearGradient(colors: [Color("pink1"), Color("blue1")], startPoint: .top, endPoint: .bottom))
                    }
                    .padding(.vertical, 5)
                    .padding(.leading, 15)
                    .padding(.trailing, 14)
                    .background(Color("profile"))
                    .cornerRadius(15)
                    HStack(spacing: 4) {
                        Image("green")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .mask(Circle())
                        Text("yozixyz.lens")
                            .font(.SFProTextMedium(size: 13))
                            .foregroundStyle(LinearGradient(colors: [Color("pink1"), Color("blue1")], startPoint: .top, endPoint: .bottom))
                    }
                    .padding(.vertical, 5)
                    .padding(.leading, 11)
                    .padding(.trailing, 12)
                    .background(Color("profile"))
                    .cornerRadius(15)
                    
                    HStack(spacing: 4) {
                        Image("house")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .mask(Circle())
                        Text("yozixyz")
                            .font(.SFProTextMedium(size: 13))
                            .foregroundStyle(LinearGradient(colors: [Color("pink1"), Color("blue1")], startPoint: .top, endPoint: .bottom))
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal, 9)
                    .background(Color("profile"))
                    .cornerRadius(15)
                    
                    HStack(spacing: 4) {
                        Image("blue")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .mask(Circle())
                        Text("yozixyz.eth")
                            .font(.SFProTextMedium(size: 13))
                            .foregroundStyle(LinearGradient(colors: [Color("pink1"), Color("blue1")], startPoint: .top, endPoint: .bottom))
                    }
                    .padding(.vertical, 5)
                    .padding(.leading, 15)
                    .padding(.trailing, 14)
                    .background(Color("profile"))
                    .cornerRadius(15)
                }
            }
            .frame(height: 28)
            
            VStack(alignment: .leading, spacing: 6) {
                Text("LIFETIME PREMIUM SNAPCHAT ‼️ Content of ALL genres🥵 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut 🎉")
                    .font(.system(size: 11))
                    .foregroundColor(.gray.opacity(0.53))
                Text("timelesswallet.xyz")
                    .font(.SFProDisplayRegular(size: 12))
                    .foregroundColor(Color("pink"))
            }
            .padding(.leading, 39)
            .padding(.trailing, 45)
            HStack(spacing: 16) {
                HStack {
//                    Image(systemName: "snow")
//                        .foregroundColor(.white)
//                        .frame(width: 14, height: 14)
//                    Text("❋")
//                        .font(.SFProDisplayRegular(size: 12))
//                        .foregroundColor(.white)
                    Text("❋ Follow")
                        .font(.SFProDisplayRegular(size: 12))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .background(Color("profile").opacity(0.5))
                .cornerRadius(15)
                HStack {
                    Image(systemName: "chevron.down")
                        .frame(width: 15, height: 15)
                        .onTapGesture {
                            //self.tabSelected = 2
                        }
                }
                .foregroundColor(.white)
                .font(.sfProDisplayBold(size: 14))
                .padding(.leading, 11)
                .padding(.trailing, 12)
                .padding(.top, 6)
                .padding(.bottom, 7)
                .background(Color("profile").opacity(0.5))
                .cornerRadius(15)
            }
            .frame(maxWidth: .infinity)
            .padding(.leading, 35)
            .padding(.trailing, 23)
            .padding(.top, 14)
            .padding(.bottom, 23)
        }
        .frame(maxWidth: .infinity)
        .background(
            .linearGradient(
                Gradient(colors:[
                    Color("Background").opacity(0),
                    Color("Background").opacity(0.5),
                    Color("Background").opacity(0.9),
                    Color("Background").opacity(1),
                    Color("Background")
                    ]),
                startPoint: .top, endPoint: .bottom
            )
        )
        
    }
    
    
    var activities: some View {
        VStack(spacing: 0) {
            tabBar
                .padding(.leading, 5)
            WalletActivities()
        }
        
    }
    func tabBarItem(_ text: String, _ selected: Bool = false) -> some View {
        VStack(spacing: 5) {
            Text(text)
                .font(.SFProDisplayRegular(size: 16))
                .fontWeight(.bold)
                .foregroundColor(selected ? .white : .gray)
            if selected {
                Color.white
                .frame( height: 2)
                .clipShape(Capsule())
            }
        }
    }
    var tabBar: some View {
        VStack(spacing: 21) {
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
}

//MARK: computed func
extension ProfileView2 {
    func hederIcon(img: String, text: String, text2: String) -> some View {
        VStack(spacing: 2) {
            Text(img)
                .font(.SFProTextSemibold(size: 18))
                .foregroundColor(.white)
                .fontWeight(.bold)
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
    
}

struct ProfileView2_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView2()
    }
}

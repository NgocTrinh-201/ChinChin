//
//  ProfileView.swift
//  ChinChin
//
//  Created by Zien on 25/05/2023.
//

import SwiftUI

struct ProfileView: View {
    
}

extension ProfileView {
    var body: some View {
        ScrollView(.vertical) {
            profile
            activities
        }
        .edgesIgnoringSafeArea(.top)
        .background(.gray)
    }
}
extension ProfileView {
    func hederIcon(img: String, text: String, text2: String) -> some View {
        VStack(spacing: 2) {
            Image(img)
                .resizable()
               // .font(.SFProDisplay(size: 20))
                .foregroundColor(.white)
                .frame(maxWidth: 21, maxHeight: 19)
            Text(text)
                .font(.SFProDisplay(size: 16))
                .foregroundColor(.white)
                .fontWeight(.bold)
            Text(text2)
                .font(.sfProDisplayBold(size: 16))
                .foregroundColor(.gray.opacity(0.36))
                .fontWeight(.regular)
        }
    }
    func textIcon(img: String, text: String) -> some View {
        HStack {
            Image(img)
                .resizable()
                .frame(width: 18, height: 18)
                .mask(Circle())
            Text(text)
             .font(.sfProDisplayBold(size: 13))                .foregroundStyle(LinearGradient(colors: [Color("pink1"), Color("blue1")], startPoint: .top, endPoint: .bottom))
        }
        .frame(width: 130, height: 28)
        .padding(.vertical, 4)
        .background(Color("profile"))
        .cornerRadius(115)
    }
    func hederActivity(img: String, text: String, text1: String) -> some View {
        HStack(spacing: 4) {
            Image(img)
                .resizable()
                .frame(width: 14, height: 14)
                .mask(Circle())
            Text(text)
                .font(.sfProDisplayBold(size: 12))             .foregroundColor(.white)
            Text(text1)
                .font(.sfProDisplayBold(size: 15))             .foregroundColor(.gray).opacity(0.5)
        }
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
            .padding(.vertical, 4)
            .background(.gray.opacity(0.36))
            .cornerRadius(24)
            .padding(.leading, -20)
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
            .padding(.trailing, -20)
        }
    }
    var content: some View {
        ZStack {
            VStack(spacing: 35) {
              //  Spacer(minLength: 150)
                Spacer(minLength: 150)
                VStack(spacing: 20) {
                    VStack(spacing: 10) {
                        HStack(spacing: 3) {
                            Text("Donald Minion")
                                .foregroundColor(.white)
                                .font(.SFProDisplay(size: 26))
                            Image("protect")
                        }
                        VStack(spacing: 15) {
                            Image("Group1")
                                .resizable()
                                .frame(width: 171, height: 19)
                                .padding(.leading, -15)
                            HStack(spacing: 7) {
                               textIcon(img: "green", text: "yozixyz.lens")
                                HStack {
                                    Image("house")
                                        .resizable()
                                        .frame(width: 18, height: 18)
                                        .mask(Circle())
                            Text("yozixyz")
                             .font(.sfProDisplayBold(size: 13))
                             .foregroundStyle(LinearGradient(colors: [Color("pink1"), Color("blue1")], startPoint: .top, endPoint: .bottom))
                                }
                                .frame(width: 87, height: 28)
                                .padding(.vertical, 4)
                                .background(Color("profile"))
                                .cornerRadius(24)
                                   // .frame(width: 110, height: 35)
                                textIcon(img: "blue", text: "yozixyz.eth")
                            }
                        }
                    }
                    VStack(alignment: .leading, spacing: 10) {
                    Text("LIFETIME PREMIUM SNAPCHAT‼️ Content of ALL genres🥵 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut 🎉")
                        .frame(width: 320)
                        .padding(.horizontal, 50)
                            .font(.system(size: 11))
                           // .font(.system(size: 11))
                        .foregroundColor(.gray.opacity(0.53))
                    Text("timelesswallet.xyz")
                        .padding(.horizontal, 50)
                        .font(.system(size: 12))
                        .foregroundColor(Color("pink"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                button
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 1.5)
        .background(.linearGradient(Gradient(colors: [Color.white.opacity(0), .black.opacity(0.7), .black.opacity(1), Color("profile")]), startPoint: .top, endPoint: .bottom))
    }
    var button: some View {
        HStack {
            HStack {
                Image("snow")
                    .foregroundColor(.white)
                    .frame(width: 14, height: 14)
                Text("Follow")
                    .font(.system(size: 12))
                    .foregroundColor(.white)
            }
            .frame(width: 263, height: 30)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color("profile").opacity(0.5))
            .cornerRadius(15)
            Image(systemName: "chevron.down")
                .foregroundColor(.white)
                .padding(.horizontal, 8)
                .font(.sfProDisplayBold(size: 14))
                .padding(.vertical, 4)
                .frame(width: 38, height: 35)
                .background(Color("profile").opacity(0.5))
                .cornerRadius(15)
        }
        .frame(width: 317, height: 28)
    }
    var profile: some View {
        ZStack {
            Image("Bitmap")
               .resizable()
                .padding(.top, -60)
                .scaledToFit()
               // .aspectRatio(0.6, contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                // status bar
                Spacer(minLength: 48)
                heder
                    .padding(.horizontal, 50)
                    .padding(.top, 15)
                    .padding(.bottom, 17)
                HStack {
                    Spacer()
                    VStack(spacing: 18) {
                        hederIcon(img: "cat", text: "7", text2: "Flower")
                        hederIcon(img: "snow", text: "22", text2: "Flowings")
                    }
                }
                .padding(.trailing, 15)
                .padding(.top, -5)
                Spacer(minLength: 70)
                content
            }

        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height )
        .background(.black)
    }
    var buttonActiovities: some View {
        HStack {
            Image("Group7")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 23, height: 23)
                .cornerRadius(6)
            Text("Stand with Crypto")
                .font(.SFProDisplay(size: 16))
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "chevron.down")
                .foregroundColor(.white)
        }
        .padding()
        .frame(width: .infinity, height: 30)
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(.gray.opacity(0.1))
        .cornerRadius(15)
    }
    var futureActiovities: some View {
        VStack(alignment: .leading) {
            Spacer()
            HStack(alignment: .top) {
                Image("Gruop11")
                    .resizable()
                    .frame(width: 32, height: 28)
                VStack(alignment: .leading) {
                    HStack {
                            Text("Receive")
                            .foregroundColor(.white)
                        Spacer()
                            Text("+ 500 AAVE")
                    }
                    .font(.system(size: 15))
                    hederActivity(img: "Group14", text: "", text1: "0x453f...234e2")
                    hederActivity(img: "Group13", text: "standwithcrypto.eth", text1: ". creator")
               
                   
                        
                }
            }
        }
    }
    var activities: some View {
        VStack {
            VStack(alignment: .leading) {
                Spacer()
                Text("Wallet Activities")
                    .font(.SFProTextMedium(size: 18))
                    .foregroundColor(.white)
                HStack(alignment: .top) {
                    Image("Group20")
                        .resizable()
                        .frame(width: 32, height: 28)
                    VStack(alignment: .leading) {
                        HStack {
                                Text("Minted NFT")
                                 .foregroundColor(.white)
                                Text(".")
                                 .foregroundColor(.white.opacity(0.5))
                                Text("15h ago")
                                 .foregroundColor(.white.opacity(0.5))
                            Spacer()
                                Image(systemName: "ellipsis")
                                 .foregroundColor(.white)
                        }
                        .font(.system(size: 15))
                        hederActivity(img: "Group14", text: "", text1: "0x453f...234e2")
                        hederActivity(img: "Group13", text: "standwithcrypto.eth", text1: ". creator")
                        buttonActiovities
                        Image("Group7")
                            .resizable()
                            .frame(width: 360, height: 350)
                            .cornerRadius(15)
                        futureActiovities
                            
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading )
            .background(Color("profile"))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

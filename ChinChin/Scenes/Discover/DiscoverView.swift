//
//  DiscoverView.swift
//  ChinChin
//
//  Created by Do Trinh on 14/05/2023.
//

import SwiftUI
import AVKit

struct DiscoverView: View {
}
let itemConten = [
    Item(img: "TimelessOGNFT (video-converter.com)", text: ["Ong là loài côn trùng có tổ chức xã hội cao như kiến, mối. Ong sống theo đàn, mỗi đàn đều có ong chúa, ong thợ, ong non... "]),
    Item(img: "habit", text: ["Dang cap thu cung", "Con tho giang ho"]),
    Item(img: "Image2", text: ["You do it2", "You do it6", "You do it5"]),
    Item(img: "Image", text: ["You do it4", "You do it8"])
]
struct Item {
    let img: String
    let text:                 [String]
}
extension DiscoverView {
    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    Text("Discover")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                            .foregroundStyle(
                                .linearGradient(
                                    colors: [.pink, .blue],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                    Spacer()
                    Image(systemName: "calendar.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 30)
                ForEach(0..<itemConten.count) {
                    index in
                    item(img: itemConten[index].img, text: itemConten[index].text)
                }
            }

            .background(.black)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}

extension DiscoverView {
    private func item(img: String, text: [String]) -> some View {
        VStack(spacing: 0) {
            if let bundle = Bundle.main.path(forResource: img, ofType: "mp4") {
                SplashPlayer(player: AVPlayer(url: URL(fileURLWithPath: bundle)), isPlaying: true)
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            } else {
                Image(img)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
            }
            VStack {
                ForEach(text, id: \.self) {
                    index in
                    Text(index)
                        .font(.sfProDisplayBold( size: UIScreen.main.bounds.height * 0.03))
                        .fontWeight(.bold)
                        .padding(.horizontal, 10)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: UIScreen.main.bounds.height * 0.1)
            .background(Color("Color1")).opacity(0.5)
        }
//        .overlay(alignment: .bottom) {
//            VStack {
//                ForEach(text, id:\.self) {
//                    t in
//                    Text(t)
//                        .font(.sfProDisplayBold(size: 25))
//                        .padding(.horizontal , 10)
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity , alignment: .leading)
//                }
//            }
//            .frame(maxWidth: .infinity)
//            .frame(height: 100)
//            .background(.black).opacity(0.8)
       // }
        .cornerRadius(15)
        .padding()
    }
}

////
////  main2.swift
////  ChinChin
////
////  Created by Zien on 10/05/2023.
////
//
//import SwiftUI
//import Combine
//import AVKit
//
//struct main2: View {
//    @State private var page = 0
//    @State private var videoToggle = true
//    @State private var isPlaying = true
//    private let spacingPage: CGFloat = 50
//    var body: some View {
//        VStack(spacing: 0) {
//            contentView
//              
//            bottomView
//        }
//        .background(.black)
//
//    }
//}
//
//
//struct main2_Previews: PreviewProvider {
//    static var previews: some View {
//        main2()
//    }
//}
//private let titleIntro = [
//    "Smart {Contract}\n Wallet",
//    "Private and\nSecure",
//    "A Place to Call\nHome",
//    "Begin Your Crypto\nJourney on Timeless",
//    "Timeless. Social"
//]
//
//private let subtitleIntro = [
//    "Self-custody without having to\n remember a long alphanumerical\n wallet address nonsense",
//    "Only you can access your assets.\nNot us. Not anyone else.",
//    "Join our world, where taste gets\n recognized and friendships are top prized",
//    "Buy, swap, sell with ease.\nStore and share your NFT collection\n with friends and family",
//    "Discover how easy it is to create\ncommunity today."
//]
//extension Font {
//    public enum Name {
//        public static let sfProDisplayBold = "Phosphate"
//    }
//}
//public extension Font {
//    static func sfProDisplayBold(size: CGFloat) -> Font {
//        return Font.custom(Name.sfProDisplayBold, size: size)
//    }
//}
//extension main2 {
//    
//    private var contentView: some View {
//        
//        VStack(spacing: 40) {
//            ZStack {
//                SplashPlayer(player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "walkthroughIntro", ofType: "mp4")!)), isPlaying: true, isLoop: true)
//                    .aspectRatio(1, contentMode: .fit)
//                    .frame(width: UIScreen.main.bounds.width)
//                    .clipped()
//            }
//              .padding(.top)
//            ZStack(alignment: .top) {
//                ForEach(titleIntro.indices, id: \.self) { index in
//                    IntroText(
//                        page: $page,
//                        isPlaying: $isPlaying,
//                        index: index,
//                        spacingPage: spacingPage,
//                        title: titleIntro[index],
//                        subtitle: subtitleIntro[index]
//                    )
//                }
//            }
//            Spacer(minLength: 0)
//        }
//    }
//    
//    struct IntroText: View {
//        @Binding var page: Int
//        @Binding var isPlaying: Bool
//        @State var opacity = false
//        @State var offsetX = CGFloat.zero
//        var index: Int
//        var spacingPage: CGFloat
//        var title: String
//        var subtitle: String
//        
//        var body: some View {
//            VStack(spacing: 0) {
//                Text(title)
//                    .tracking(-0.2)
//                    .font(.sfProDisplayBold(size: 30))
//                    .foregroundColor(Color.white)
//                    .fixedSize(horizontal: false, vertical: true)
//                    .multilineTextAlignment(.center)
//                 .padding(.bottom)
//                Text(subtitle)
//                    .tracking(-0.2)
//                    .font(.sfProDisplayBold(size: 17))
//                    .foregroundColor(Color.white.opacity(0.8))
//                    .multilineTextAlignment(.center)
//                    .padding(.horizontal, 40)
//            }
//            .onAppear {
//                opacity = index == 0
//                if page == index {
//                    offsetX = 0
//                } else if page < index {
//                    offsetX = spacingPage
//                } else {
//                    offsetX = -spacingPage
//                }
//            }
//            .offset(x: offsetX)
//            .opacity(opacity ? 1 : 0)
//            .onChange(of: page) { value in
//                if !isPlaying { return }
//                
//            }
//        }
//    }
//}
//
//    private var bottomView: some View {
//        VStack(spacing: 19) {
//            HStack {
//                Spacer()
//                Text("Create a New Wallet")
//                    .foregroundStyle(LinearGradient(colors: [Color.white],
//                                                    startPoint: .top,
//                                                    endPoint: .bottom))
//                    .font(.sfProDisplayBold(size: 17))
//                Spacer()
//            }
//            .frame(width: UIScreen.main.bounds.width - 64, height: 48)
//            .background(Color("Color1").cornerRadius(24))
//            .onTapGesture {
//               
//                }
//            Button(action: { }) {
//                    Text("I already have one")
//                        .foregroundColor(Color.white.opacity(0.8))
//                        .font(.sfProDisplayBold(size: 14))
//                }
//            }
//
//        }
// 

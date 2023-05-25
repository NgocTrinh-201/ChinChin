//
//  main2.swift
//  ChinChin
//
//  Created by Zien on 10/05/2023.
//

import SwiftUI
import Combine
import AVKit

struct OnboardingSplashScreenView: View {
    @State private var page = 0
    @State private var videoToggle = true
    @State private var isPlaying = true
    @State private var isShowingCreateWallet = false
    @State private var showSheet = false
    private let spacingPage: CGFloat = 50
    @State var success = false
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink("", destination: WelcomView(), isActive: $success)
                VStack(spacing: 0) {
                    contentView
                    bottomView
                }
                .sheet(isPresented: $isShowingCreateWallet) {
                    SignUpView(isShowing: $isShowingCreateWallet, nextButtonCallback: {
                        showSheet.toggle()
                    })
                        .transition(.move(edge: .bottom))
                }
                .transition(.scale)
            }
            .navigationBarHidden(true)
            .background(Color("Background"))
        }
        .overlay {
            if showSheet {
                ZStack(alignment: .bottom) {
                    Color.black
                        .opacity(0.5)
                   loading
                }
                .edgesIgnoringSafeArea(.bottom)
                .transition(.move(edge: .bottom))
            }
        }
        
    }
}

extension OnboardingSplashScreenView {
    private var bottomView: some View {
        VStack(spacing: 19) {
            HStack {
                Spacer()
                Text("Create a New Wallet")
                    .foregroundStyle(LinearGradient(colors: [Color.white],
                                                    startPoint: .top,
                                                    endPoint: .bottom))
                    .font(.sfProDisplayBold(size: 17))
                    .onTapGesture {
                        isShowingCreateWallet.toggle()
                    }
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width - 64, height: 48)
            .background(Color("Color1").cornerRadius(24))
            .onTapGesture {
                }
            Button(action: {}) {
                    Text("I already have one")
                        .foregroundColor(Color.white.opacity(0.8))
                        .font(.sfProDisplayBold(size: 14))
                }
            }

        }
}

struct OnboardingSplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingSplashScreenView()
    }
}

extension Font {
    public enum Name {
        public static let sfProDisplayBold = "SFProDisplay-Bold"
        public static let Phosphate = "Phosphate"
        public static let SFProDisplay = "SFProDisplay-Black"
        public static let SFProTextMedium = "SFProText-Medium"
    }
}
public extension Font {
    static func sfProDisplayBold(size: CGFloat) -> Font {
        return Font.custom(Name.sfProDisplayBold, size: size)
    }
    static func phosphate(size: CGFloat) -> Font {
        return Font.custom(Name.Phosphate, size: size)
    }
    static func SFProDisplay(size: CGFloat) -> Font {
        return Font.custom(Name.SFProDisplay, size: size)
    }
    static func SFProTextMedium(size: CGFloat) -> Font {
        return Font.custom(Name.SFProTextMedium, size: size)
    }
}

extension OnboardingSplashScreenView {
    var loading: some View {
        VStack(spacing: 0) {
            Spacer()
            Image("createWalletLogo")
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .foregroundColor(.white)
            Text("Creating the wallet")
                .font(.sfProDisplayBold(size: 30))
                .foregroundColor(.white)
            LottieView(name: "confirmation-loading", loopMode: .constant(.loop), isAnimating: .constant(true))
                .scaledToFill()
                .aspectRatio(2, contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width * 0.5)
                .frame(height: UIScreen.main.bounds.height * 0.1)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        showSheet.toggle()
                        success.toggle()
                    }
                }
            Text("Go ahead we a family ")
                .font(.sfProDisplayBold(size: 20))
                .foregroundColor(.white)
            Spacer()
        }
        .frame(height: UIScreen.main.bounds.height * 0.3)
        .frame(maxWidth: .infinity)
        .background(Color("Color1"))
        .cornerRadius(20)
        .transition(.move(edge: .bottom))
    }
}

extension OnboardingSplashScreenView {
    private var contentView: some View {
        VStack(spacing: 40) {
            ZStack {
                SplashPlayer(player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "walkthroughIntro (video-converter.com)", ofType: "mp4")!)), isPlaying: true)
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
              .padding(.top)
            ZStack(alignment: .top) {
                IntroText(
                    page: $page,
                    isPlaying: $isPlaying,
                    spacingPage: spacingPage
                )
            }
            Spacer(minLength: 0)
        }
    }
    struct IntroText: View {
        @Binding var page: Int
        @Binding var isPlaying: Bool
        @State var opacity = false
        @State var offsetX = CGFloat.zero
        var spacingPage: CGFloat
        var body: some View {
            VStack(spacing: 0) {
                Text("Smart {Contract}\n Wallet")
                    .tracking(-0.2)
                    .font(.phosphate(size: 30))
                    .foregroundColor(Color.white)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                 .padding(.bottom)
                Text("Self-custody without having to\n remember a long alphanumerical\n wallet address nonsense")
                    .tracking(-0.2)
                    .font(.sfProDisplayBold(size: 17))
                    .foregroundColor(Color.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }
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
//            }
        }
    }
}


//
//  WelcomView.swift
//  ChinChin
//
//  Created by Do Trinh on 13/05/2023.
//

import SwiftUI
import CollectionViewPagingLayout

struct Step: Identifiable {
    let id: Int
}
struct WalletView: View {
    @State var currentIndex: Step.ID? = 0
    @State var showSheet = false
}
let steps = [
    Step(id: 0),
    Step(id: 1),
    Step(id: 2)
]
// bodyMainItem
extension WalletView {
    var body: some View {
        VStack {
//            Text("\(Int(self.currentIndex ?? 0))"/"
//                .foregroundColor(.white)
            heder
            incadorItem
            ScalePageView(steps, selection: $currentIndex) { step in
                switch step.id {
                case 0: mainImg(img: "Image", text: "chinchin1")
                    // .frame(width: UIScreen.main.bounds.width - 30)
                    .scaleEffect(0.8)
                case 1: DiscoverView()
                        .scaleEffect(0.8)
                default : OnboardingSplashScreenView()
                        .scaleEffect(0.8)
                }
            }
            .options(
                ScaleTransformViewOptions(
                    minScale: 0.9,
                    scaleRatio: 0.9,
                    translationRatio: CGPoint(x: 0.83, y: 0.3),
                    maxTranslationRatio: CGPoint(x: 3, y: 0),
                                    keepVerticalSpacingEqual: false,
                                    keepHorizontalSpacingEqual: false,
                                    scaleCurve: .linear,
                                    translationCurve: .linear
//                    minScale: 1.2,
//                                   maxScale: 1.2,
//                                   scaleRatio: 0,
//                                   translationRatio: .zero,
//                                   minTranslationRatio: .zero,
//                                   maxTranslationRatio: .zero,
//                                   shadowEnabled: false,
//                                   rotation3d: .init(angle: .pi / 3, minAngle: -.pi, maxAngle: .pi, x: 0, y: -1, z: 0, m34: -0.002),
//                                   translation3d: .init(translateRatios: (0.1, 0, 0),
//                                                        minTranslateRatios: (-0.05, 0, 0.86),
//                                                        maxTranslateRatios: (0.05, 0, -0.86))
                               )
                )
            .allowsHitTesting(true)
            HStack {
                ForEach(0..<steps.count) { index in
                    let isCurrent = index == (Int(self.currentIndex ?? 0))
                    Rectangle()
                        .frame(width: isCurrent ? 18 : 6,
                               height: 6)
                        .cornerRadius(.infinity)
                        .foregroundColor(Color.white.opacity(isCurrent ? 1 : 0.5))
                        .animation(.default)
                }
            }
            .padding(24)
            Spacer()
        }
        .background(.black)
        .sheet(isPresented: $showSheet) {
            
        }
    }
}

extension WalletView {
    private var heder: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Monday, Maay 15")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Image("pancakeswap-cake-logo")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            .padding()
            VStack(alignment: .leading) {
                Text("$0.00")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Text("PROTFOLIO BALANCE ")
                    .foregroundColor(.gray)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    private func incador(img: String, text: String) -> some View {
        VStack {
            Image(systemName: img)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
            Text(text)
                .foregroundColor(.white)
        }
    }
    private var incadorItem: some View {
        HStack {
            Spacer()
            incador(img: "keyboard.macwindow", text: "Buy");
            Spacer()
            incador(img: "qrcode.viewfinder", text: "Scan QR");
            Spacer()
            incador(img: "scribble", text: "Exchange")
            Spacer()
        }
    }
}
extension WalletView {
    private func mainImg(img: String, text: String) -> some View {
        VStack {
           
            
                VStack(alignment: .leading) {
                    HStack {
                        Text(text)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Image("checkmark.seal.fill.blue")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Spacer()
                        Image(systemName: "clear")
                            .foregroundColor(.white)
                            .onTapGesture {
                                showSheet.toggle()
                            }
                    }
                    Spacer()
                      Text("$-----")
                          .foregroundColor(.white)
                }
            .padding()
          //  .frame(maxWidth:.infinity)
            .background(.red)
            Image(img)
                .resizable()
                .scaledToFit()
               .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                .aspectRatio(2, contentMode: .fit)
            Spacer()
            Spacer()
        }
       // .frame(height: UIScreen.main.bounds.height * 0.6 )
        .background(Color("Color1"))
        .cornerRadius(15)
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}

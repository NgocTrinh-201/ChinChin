//
//  WelcomView.swift
//  ChinChin
//
//  Created by Do Trinh on 13/05/2023.
//

import SwiftUI
import CollectionViewPagingLayout

struct ImgItem: Identifiable {
    let id: Int
    var img: String
    var text: String
}
struct WelcomView: View {
    @State var currentIndex: ImgItem.ID? = 0
    @State private var isShowingDiscove = false
}
let items = [
    ImgItem(id: 0, img: "Image", text: "chinchin1"),
    ImgItem(id: 1, img: "Image2", text: "chinchin1")
]
// body
extension WelcomView {
    var body: some View {
        VStack {
            if isShowingDiscove {
                NavigationBar()
            } else {
                Text("\(Int(self.currentIndex ?? 0))")
                    .foregroundColor(.white)
                heder
                mainContent
                button
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .background(.black)
    }
}

extension WelcomView {
    private var heder: some View {
        Text("Welcom")
            .foregroundColor(.white)
    }
    private var incador: some View {
        HStack {
        }
    }
}
extension WelcomView {
    private func mainImg(img: String, text: String) -> some View {
        VStack {
            Spacer()
            Image(img)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.width - 20)
                .aspectRatio(1, contentMode: .fit)
            Text(text)
                .foregroundColor(.white)
                .lineLimit(4)
            Spacer()
            Spacer()
        }
        .frame(height: UIScreen.main.bounds.height * 0.7 )
        .background(Color("Color1"))
        .cornerRadius(15)
    }
}
extension WelcomView {
    private var mainContent: some View {
        VStack {
            ScalePageView(items, selection: $currentIndex) { step in
                mainImg(img: step.img, text: step.text)
                    // .frame(width: UIScreen.main.bounds.width - 30)
                    .scaleEffect(0.85)
            }
            .options(
                ScaleTransformViewOptions(
                    minScale: 1,
                    translationRatio: CGPoint(x: 0.85, y: 0),
                    maxTranslationRatio: CGPoint(x: 0.85, y: 0),
                    translationCurve: .linear
                )
            )
            .allowsHitTesting(true)
            HStack {
                ForEach(0..<items.count) { index in
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
    }
}

extension WelcomView {
    private var button: some View {
        HStack {
            Button {
            } label: {
                Text("Get Started")
                    .foregroundColor(.white)
                    .onTapGesture {
                        isShowingDiscove.toggle()
                    }
            }
            .padding()
            .frame(height: 50 )
            .background(Color("Color1"))
            .cornerRadius(15)
        }
    }
}
struct WelcomView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomView()
    }
}




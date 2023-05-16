//
//  NavigationBar.swift
//  ChinChin
//
//  Created by Do Trinh on 14/05/2023.
//

import SwiftUI
struct NavigationBar: View {
    @State var cuuture = 0
}

extension NavigationBar {
    var body: some View {
        VStack(spacing: 0) {
            switch cuuture {
            case 0:
                DiscoverView()
            case 1:
                WalletView()
            default: DiscoverView()
            }
            HStack {
                Spacer()
               item(img: "sparkles.square.filled.on.square", text: "Discover")
                    .onTapGesture {
                        cuuture = 0
                    }
                Spacer()
                item(img: "bolt.shield.fill", text: "Wallet")
                    .onTapGesture {
                        cuuture = 1
                    }
                Spacer()
                item(img: "bubble.left.and.bubble.right.fill", text: "Chat")
                    .onTapGesture {
                        cuuture = 2
                    }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: UIScreen.main.bounds.height * 0.1)
            .background(.black)
        }
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
extension NavigationBar {
    private func item(img: String, text: String) -> some View {
        VStack {
            Image(systemName: img)
                .resizable()
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.height * 0.02, height: UIScreen.main.bounds.height * 0.02 )
            Text(text)
                .foregroundColor(.white)
                .font(.custom("", size: UIScreen.main.bounds.height * 0.02))
        }
    }
}

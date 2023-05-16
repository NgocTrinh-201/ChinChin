//
//  TimelessOGView.swift
//  ChinChin
//
//  Created by Do Trinh on 14/05/2023.
//

import SwiftUI

let UISize = UIScreen.main.bounds

struct TimelessOGView: View {
    @State var scale = 1.0
    @GestureState private var translation: CGFloat = 44
    @State var showAppbar = false
}

extension TimelessOGView {
    var body: some View {
        ZStack(alignment: .top) {
            Image("Image2")
                .resizable()
                .frame(width: UISize.width, height: UISize.height * 0.6)
                .background(.white)
                .scaleEffect(scale)
                .overlay(alignment: .top) {
                    if showAppbar {
                        HStack {
                            Text("Timeless OG")
                                .foregroundColor(.white)
                        }
                        .frame(width: UISize.width, height: 50)
                        .background(.black.opacity(0.5))
                        .transition(.move(edge: .top))
                        .animation(.spring())
                    }
                }
            ScrollView {
                GeometryReader {
                    pink in
                    let minY = pink.frame(in: .global).minY
                    let progress = (minY * 0.6) / 44
                    let scales = progress < 1 ? 1.0 : progress
                    let showAppbar = minY <= -180
                    VStack(spacing: 0) {
                        VStack {
                            Spacer()
                            Text("Timeless OG")
                                .padding(20)
                        }
                        .frame(width: UISize.width,height: UISize.height * 0.6, alignment: .bottomLeading)
                        VStack {
                            Text("\(minY)")
                                .foregroundColor(.white)
                        }
                        .frame(width: UISize.width, height: UISize.height * 0.4)
                        .background(Color("Color1"))
                    }
                    .onAppear {
                        scale = scales
                    }
                    .onChange(of: scales) {
                        newValue in
                        scale = newValue
                    }
                    .onChange(of: showAppbar) {
                        value in
                        self.showAppbar = value
                    }
                }
                .frame(width: UISize.width, height: UISize.height)
            }
        }
        .background(.black)
    }
}

struct TimelessOGView_Previews: PreviewProvider {
    static var previews: some View {
        TimelessOGView()
    }
}

//
//  TimelessOGView.swift
//  ChinChin
//
//  Created by Do Trinh on 14/05/2023.
//

import SwiftUI
import AVKit
let UISize = UIScreen.main.bounds

struct TimelessOGView: View {
    @State var scale = 1.0
    @GestureState private var translation: CGFloat = 44
    @State var showAppbar = false
}

extension TimelessOGView {
    var body: some View {
        ZStack(alignment: .top) {
            SplashPlayer(player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "TimelessOGNFT (video-converter.com)", ofType: "mp4")!)), isPlaying: true, isLoop: true)
                .frame(width: UISize.width / 0.7, height: UISize.height / 1)
                .padding(.top, -200)
                .scaleEffect(scale)
                .edgesIgnoringSafeArea(.bottom)
                iconAppBar
                    .frame(width: .infinity, alignment: .leading)
                    .padding(.horizontal , -170)
                .overlay(alignment: .top) {
                    if showAppbar {
                        HStack {
                            iconAppBar
                                .padding(.horizontal, 20)
                            Spacer()
                            Text("Timeless OG")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.leading, -30)
                            Spacer()
                        }
                        .frame(width: UISize.width, height: 50)
                        .background(Color("testt"))
                        .transition(.move(edge: .top))
                        .animation(.spring())
                    }
                }
            ScrollView {
                GeometryReader { pink in
                    let minY = pink.frame(in: .global).minY
                    let progress = (minY * 0.6) / 44
                    let scales = progress < 1 ? 1.0 : progress
                    let showAppbar = minY <= -180
                    VStack(spacing: 0) {
                        VStack {
                            Spacer()
                            Text("Timeless OG")
                                .padding(20)
                                .font(.sfProDisplayBold(size: 25))
                                .foregroundColor(.white)
                        }
                        .frame(width: UISize.width,height: UISize.height * 0.6, alignment: .bottomLeading)
                        VStack {
                            Text("Here to the OGs - a consmic combo of bee and rover to remind you that the sky's the limit.")
                                .padding()
                                .foregroundColor(.white).opacity(0.7)
                                .font(.system(size: 20))
                            Text("Mintable gfor 6 wks starting from april 5th ah ")
                                .padding(.horizontal, 30)
                                .foregroundColor(.gray)
                                .font(.system(size: 15))
                            Text("ahahahhh ahahahhh ahahaha ahah ")
                                .padding(.horizontal, 30)
                                .foregroundColor(.gray)
                                .font(.system(size: 15))
//                            Text("\(minY)")
//                                .foregroundColor(.white)
                            HStack {
                                Spacer()
                                Text("Mint NFT")
                                    .foregroundStyle(LinearGradient(colors: [.pink, .blue],
                                                                    startPoint: .top,
                                                                    endPoint: .bottom))
                                    .font(.sfProDisplayBold(size: 17))
                                Spacer()
                            }
                            .frame(width: UIScreen.main.bounds.width - 64, height: 48)
                            .background(.gray.opacity(0.2))
                            .cornerRadius(24)
                            Text("")
                        }
                        .background(Color("testt"))
                    }
                    .onAppear {
                        scale = scales
                    }
                    .onChange(of: scales) { newValue in
                        scale = newValue
                    }
                    .onChange(of: showAppbar) { value in
                        self.showAppbar = value
                    }
                }
                .frame(width: UISize.width, height: UISize.height)
            }
        }
        .background(Color("testt"))
        .edgesIgnoringSafeArea(.bottom)
    }
}
extension TimelessOGView {
    private var iconAppBar: some View {
        ZStack(alignment: .leading){
            Color.gray.opacity(0.36)
                .mask(Circle())
                .overlay {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.white).opacity(0.5)
                       // .font(Font.sfProTextBold(size: 14))
                }
                .frame(width: 25, height: 25, alignment: .leading)
                .padding(.trailing, 20 )
        }
    }
}

struct TimelessOGView_Previews: PreviewProvider {
    static var previews: some View {
        TimelessOGView()
    }
}

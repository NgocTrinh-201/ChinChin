////
////  ContentView.swift
////  ChinChin
////
////  Created by Do Trinh on 09/05/2023.
////
//
//import SwiftUI
//import AVKit
//import UIKit
//struct SplashPlayer: UIViewControllerRepresentable {
//    typealias UIViewControllerType = AVPlayerViewController
//    var player: AVPlayer
//    var isPlaying: Bool
//    var isLoop = false
//    var willStopSplash = false
//    var viewController = UIViewControllerType()
//
//    func makeCoordinator() -> Coodinator {
//        return Coordinator(willStopSplash: willStopSplash)
//    }
//
//    final class Coodinator: NSObject {
//        var willStopSplash: Bool
//
//        init(willStopSplash: Bool) {
//            self.willStopSplash = willStopSplash
//        }
//    }
//
//    func makeUIViewController(context: Context) -> UIViewControllerType {
//        player.actionAtItemEnd = .none
//        viewController.player = player
//        viewController.view.backgroundColor = .clear
//        viewController.showsPlaybackControls = false
//        viewController.entersFullScreenWhenPlaybackBegins = true
//        viewController.exitsFullScreenWhenPlaybackEnds = !isLoop
//
////        if isLoop {
////            NotificationCenter.default.addObserver(viewController,
////                                                   selector: #selector(viewController.playerItemDidReachEnd(notification:)),
////                                                   name: .AVPlayerItemDidPlayToEndTime,
////                                                   object: viewController.player?.currentItem)
////        }
//
//        return viewController
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//        if isPlaying {
//            if !context.coordinator.willStopSplash {
//                context.coordinator.willStopSplash = true
//                uiViewController.player?.play()
//            }
//        } else {
//            uiViewController.player?.pause()
//            uiViewController.player?.seek(to: .zero)
//        }
//    }
//}
//struct ContentView: View {
//    var x = 6
//    @State var tap = false
//    @State var scale = 1.0
//}
//extension ContentView {
//    var body: some View {
//        VStack {
//            if tap {
//                main2()
//                    .transition(.move(edge: .bottom))
//
//            } else {
//                SplashPlayer(player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "splash", ofType: "mp4")!)), isPlaying: true, isLoop: true)
//                    .onTapGesture {
//                        tap.toggle()
//                    }
//                    .transition(.scale)
//            
//            }
//        }
//        .background(.black)
//        .animation(.linear(duration: 1))
////        .onTapGesture {
////           scale = 0.0
////        }
////        .animation(.linear(duration: 2), value: scale)
////        //.opacity(tap ? 0 : 1)
////        .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 2), value: tap)
//
//    }
//}
//
//extension ContentView {
//    var Helo: some View {
//        Text("Xin chao \(x)")
//        
//    }
//}
//extension View {
//    func TextFrame  () -> some View {
//        return self
//            .frame(width: 50, height: 50)
//            .background(.red)
//    }
//}
//extension View {
//    func textTile () -> some View {
//        return self
//            .font(.custom("sd", size: 20))
//            .background(.blue)
//            .foregroundColor(.white)
//    }
//}
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

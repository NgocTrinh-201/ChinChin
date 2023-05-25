//
//  ContentView.swift
//  ChinChin
//
//  Created by Do Trinh on 09/05/2023.
//

import SwiftUI
import AVKit
import UIKit
import AVFoundation

struct SplashPlayer: UIViewControllerRepresentable {
    typealias UIViewControllerType = AVPlayerViewController
    var player: AVPlayer
    var isPlaying: Bool
    var isLoop = false
    var willStopSplash = false
    var viewController = UIViewControllerType()

    func makeCoordinator() -> Coodinator {
        return Coordinator(willStopSplash: willStopSplash)
    }

    final class Coodinator: NSObject {
        var willStopSplash: Bool

        init(willStopSplash: Bool) {
            self.willStopSplash = willStopSplash
        }
    }

    func makeUIViewController(context: Context) -> UIViewControllerType {
        player.actionAtItemEnd = .none
        viewController.player = player
        viewController.view.backgroundColor = .clear
        viewController.showsPlaybackControls = false
        viewController.entersFullScreenWhenPlaybackBegins = true
        viewController.exitsFullScreenWhenPlaybackEnds = !isLoop
        
       
        
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        if isPlaying {
            if !context.coordinator.willStopSplash {
                context.coordinator.willStopSplash = true
                uiViewController.player?.play()
            }
        } else {
            uiViewController.player?.pause()
            uiViewController.player?.seek(to: .zero)
        }
    }
}

struct TimelessWallwtApp: View {
    @State var tap = false
    @State var scale = 1.0
}

extension TimelessWallwtApp {
    var body: some View {
        VStack {
            if tap {
                OnboardingSplashScreenView()
                   // .transition(.move(edge: .bottom))

            } else {
                SplashPlayer(player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "splash (video-converter.com)", ofType: "mp4")!)), isPlaying: true)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            tap.toggle()
                        }
                    }
                    .transition(.scale)
            }
        }
        .background(.black)
        .animation(.spring())
    }
}
struct TimelessWallwtApp_Previews: PreviewProvider {
    static var previews: some View {
        TimelessWallwtApp()
    }
}

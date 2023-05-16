//
//  SignUpView.swift
//  ChinChin
//
//  Created by Do Trinh on 13/05/2023.
//

import SwiftUI
import Lottie

struct SignUpView: View {
    @Binding var isShowing: Bool
    @State var email: String = ""
    @State var showSheet = false
    let nextButtonCallback: ()-> Void
}

extension SignUpView {
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                hederContain
                mainContain
                Spacer()
            }
            .padding()
            .padding(.horizontal, 20)
            .background(Color("Background"))
            
//                .sheet(isPresented: $showSheet) {
//                    loading
//                }
        }
    }
}

extension SignUpView {
    var hederContain: some View {
        HStack {
            Spacer()
                Text("Creat New Wallet")
                    .foregroundColor(.white)
                    .padding(.horizontal, 60)
            Spacer()

        }
        .overlay(alignment: .leading) {
            Image(systemName: "xmark.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .onTapGesture {
                   isShowing.toggle()
                    
                }
        }
    }
}
extension SignUpView {
     var mainContain: some View {
         VStack(spacing: 20) {
             Text(" Easy Creation")
                 .font(.custom("SFProDisplay-Bold", size: 30))
                 .foregroundColor(.white)
                 .fontWeight(.bold)
                 CustomTextField(text: $email, hint: "Enter you email")
                 .padding()
                 .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                 .background(Color("Color1"))
                 .cornerRadius(15)
             Button {
                 isShowing.toggle()
                 self.nextButtonCallback()
             } label: {
                 Text("Next")
                     .padding()
                     .frame(maxWidth: .infinity, maxHeight: 50)
                     .background(Color("Color1").opacity(0.5))
                     .foregroundColor(.white)
                     .cornerRadius(15)
             }  
             HStack {
                 Spacer()
                     .frame( maxHeight: 1)
                     .background(.white)
                Text("or sign in with:")
                     .padding()
                     .fixedSize(horizontal: true, vertical: false)
                     .lineLimit(1)
                     .foregroundColor(.white)
                 Spacer()
                     .frame( maxHeight: 1)
                     .background(.white)
             }
             Image("apple_signIn")
                 .resizable()
                 .frame(width: 40, height: 40, alignment: .center)
                 .foregroundColor(.white)
             Spacer()
             Spacer()
             Spacer()
         }
         .padding(.horizontal, 10)
    }
}
//
// struct SignUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpView()
//    }
//}
struct CustomTextField: View {
    @Binding var text: String
    let hint: String
    var body: some View {
        ZStack {
            TextField("", text: $text)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            if text.isEmpty {
                Text(hint)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .foregroundColor(.white).opacity(0.3)
            }
        }
    }
}

struct LottieView: UIViewRepresentable {
    // MARK: - Input parameters
    var name: String!
    @Binding var loopMode: LottieLoopMode
    @Binding var isAnimating: Bool
    var tintColor: UIColor?

    // MARK: - Properties
    var animationView = LottieAnimationView()

    class Coordinator: NSObject {
        var parent: LottieView

        init(_ animationView: LottieView) {
            self.parent = animationView
            super.init()
        }
    }

    // MARK: - Methods
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView()

        animationView.animation = LottieAnimation.named(name)
        animationView.contentMode = .scaleAspectFit
        if let tintColor = tintColor {
            let colorProvider = ColorValueProvider(tintColor.lottieColorValue)
            animationView.setValueProvider(colorProvider,
                                           keypath: AnimationKeypath(keypath: "Heart Icon AI File Outlines.Group *.Fill *.Color"))
            animationView.setValueProvider(colorProvider,
                                           keypath: AnimationKeypath(keypath: "Shape Layer *.Ellipse *.Fill *.Color"))
        }
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        view.clipsToBounds = true

        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        animationView.loopMode = self.loopMode
        isAnimating ? context.coordinator.parent.animationView.play() : context.coordinator.parent.animationView.stop()
    }
}

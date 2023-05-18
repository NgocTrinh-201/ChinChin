//
//  WelcomView.swift
//  ChinChin
//
//  Created by Do Trinh on 13/05/2023.
//

import SwiftUI
import CollectionViewPagingLayout
import LocalAuthentication

struct Step: Identifiable {
    let id: Int
}
struct WalletView: View {
    @State var currentIndex: Step.ID? = 0
    @State var showSheet = false
    @State private var isShowingModal = false
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
        .sheet(isPresented: $isShowingModal) {
            VStack {
                Spacer()
                Spacer()
                    .frame(maxWidth: .infinity, maxHeight: 500)
                    .background(.red)
            }
//            let randomvalue = Int.random(in: 0...4)
//            switch randomvalue {
//            case 1: TransactionView(isShowing: $isShowingModal, type: .safeTransaction)
//            case 2: TransactionView(isShowing: $isShowingModal, type: .criticalWarmning)
//            case 3: TransactionView(isShowing: $isShowingModal, type: .transactionWarmning)
//            default : TransactionView(isShowing: $isShowingModal, type: .transactionFlagged)
//            }
        }
    }
}
extension WalletView {
    var loading: some View {
        VStack(spacing: 0) {
            Spacer()
            HStack {
                Image(systemName: "clear")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .leading)
                    .onTapGesture {
                        showSheet.toggle()
                    }
            }
            .padding()
            .frame(maxWidth: .infinity , alignment: .leading)
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
            incador(img: "qrcode.viewfinder", text: "Scan QR")
                .onTapGesture {
                    isShowingModal.toggle()
                }
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
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
                .aspectRatio(2, contentMode: .fit)
            Spacer()
            Spacer()
        }
       .frame(height: UIScreen.main.bounds.height * 0.5 )
        .background(Color("Color1"))
        .cornerRadius(15)
    }
}
extension WalletView {
    private func transactionView() -> some View {
        VStack {
            HStack {
                Image("qr_finder_icon")
                    .resizable()
                    .frame(width: 25, height: 25)
                Text("Safe transaction")
                    .font(.custom("", size: 20))
                Spacer()
                Image("qr_finder_icon")
                    .resizable()
                    .frame(width: 25, height: 25)
            }
        }
    }
}
struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}

struct TransactionView: View {
    @Binding var isShowing: Bool
    let type: TransactionViewType
    var body: some View {
        VStack {
            VStack {
                //
                HStack(spacing: 20) {
                    Image("qr_finder_icon")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text(getTitle())
                        .font(.custom("", size: 20))
                        .foregroundColor(.white)
                    Spacer()
                    Image("qr_finder_icon")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                criticalWarmningText
                    .foregroundColor(.white)
                    .font(.custom("", size: 15))
                    .lineLimit(5)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.vertical, 20)
                if (type != TransactionViewType.transactionFlagged) {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("To Address")
                            .font(.custom("", size: 14))
                            .foregroundColor(.white)
                        HStack(spacing: 20) {
                            Image("checkmark.seal.fill.blue")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .mask(Circle())
                            Text("0xrui...jaihia")
                                .font(.custom("", size: 17))
                                .foregroundColor(.white)
                            Spacer()
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(15)
                    VStack(alignment: .leading, spacing: 15) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Simulation Results")
                                .font(.custom("", size: 14))
                                .foregroundColor(.white.opacity(0.5))
                            Text("Approve tranfer all your DAI")
                                .font(.custom("", size: 18))
                                .foregroundColor(.pink.opacity(0.5))
                        }
                        line
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Send")
                                .font(.custom("", size: 14))
                                .foregroundColor(.white.opacity(0.5))
                            HStack(spacing: 15) {
                                Image("checkmark.seal.fill.blue")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .mask(Circle())
                                Text("25 ETH")
                                    .font(.custom("", size: 18))
                                    .foregroundColor(.white)
                            }
                        }
                        line
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Recive")
                                .font(.custom("", size: 14))
                                .foregroundColor(.white.opacity(0.5))
                            HStack(spacing: 15) {
                                Image("checkmark.seal.fill.blue")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .mask(Circle())
                                Text("25 ETH")
                                    .font(.custom("", size: 18))
                                    .foregroundColor(.white)
                            }
                        }
                        line
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Requested by")
                                    .font(.custom("", size: 14))
                                    .foregroundColor(.white.opacity(0.5))
                                Text("app.uniswap.org")
                                    .font(.custom("", size: 18))
                                    .foregroundColor(.pink.opacity(0.5))
                            }
                            Spacer()
                            Image("cqr_finder_icon")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .mask(Circle())
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(15)
                    Spacer()
                } else {
                    Image("habit")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                }
            }
            Spacer()
            Button {
                buttonActionHandle()
            } label: {
                Text(getButtonText())
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.5))
                    .cornerRadius(25)
                    .padding(.horizontal, 20)
            }
        }
        .padding()
        .background(getBacgroundColor())
    }
    var line: some View {
        Spacer()
            .frame(height: 0.2)
            .frame(maxWidth: .infinity)
            .background(.white)
    }
    var criticalWarmningText: some View {
        Text("We believe this transaction is ") +
        Text("malicious")
            .foregroundColor(.pink.opacity(0.5)) +
        Text(" and ") +
        Text("unsafe").foregroundColor(.pink.opacity(0.5)) +
        Text("to sign. Approving may lead to ") + Text("loss of funds").foregroundColor(.pink.opacity(0.5)) +
        Text(" .")
    }
    func getBacgroundColor() -> Color {
        switch type {
        case .criticalWarmning: return Color("backgroundColor2")
        case .safeTransaction:
            return Color("backgroundColor1")
        case .transactionWarmning:
            return Color("backgroundColor3")
        case .transactionFlagged:
            return Color("backgroundColor4")
        }
    }
    func getTitle() -> String {
        switch type {
        case .criticalWarmning: return "Critical Warming"
        case .safeTransaction:
            return "Safe transaction"
        case .transactionWarmning:
            return "Warming"
        case .transactionFlagged:
            return "Transaction Flagged"
        }
    }
    func getButtonText() -> String {
        switch type {
        case .criticalWarmning: return "Proceed with warmning"
        case .safeTransaction:
            return "Proceed"
        case .transactionWarmning:
            return "Proceed with warmning"
        case .transactionFlagged:
            return "Close"
        }
    }
    func buttonActionHandle() {
        switch type {
        case .criticalWarmning: biometric(); break;
        case .safeTransaction: biometric(); break;
        case .transactionWarmning: biometric(); break;
        case .transactionFlagged:
            isShowing.toggle()
        }
    }
    func biometric() {
        print("Biometric")
        let context = LAContext()
            var error: NSError?
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Identify yourself!"
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                    success, authenticationError in
                    DispatchQueue.main.async {
                        if success {
                            print("Sucessful")
                        } else {
                            print("Failure")
                        }
                        isShowing.toggle()
                    }
                }
            } else {
                print("No biometric")
            }
    }
}

enum TransactionViewType {
    case safeTransaction
    case criticalWarmning
    case transactionWarmning
    case transactionFlagged
}

//
//  WalletActivities.swift
//  ChinChin
//
//  Created by Do Trinh on 26/05/2023.
//

import SwiftUI

struct WalletActivities: View {
    let filterItems = ["ALL", "RECEIVE", "SEND", "SWAP", "READ PACKET", "MINT NFT"]
    // MARK: State
    @State var filterChoose = "ALL"
}
// MARK: body
extension WalletActivities {
    var body: some View {
        VStack(spacing: 35) {
            VStack(alignment: .leading, spacing: 11) {
                Text("Wallet Activites")
                    .font(.SFProTextSemibold(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                filterBar
            }
            ////
            ScrollView(.vertical) {
                content
                Spacer()
            }
        }
        .padding(.leading, 23)
        .padding(.top, 27)
        .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
        .background(Color("Background"))
    }
}
// MARK: subview
extension WalletActivities {
    func filterItem(_ value: String, _ selected: Bool) -> some View {
        Text(value)
            .foregroundStyle(LinearGradient(colors: [Color("pink1"), Color("blue1")], startPoint: .top, endPoint: .bottom))
//            .frame(width: 85, height: 24)
            .font(.SFProDisplayRegular(size: 12))
            .padding(.leading, 31)
            .padding(.trailing, 32)
            .padding(.vertical, 5)
            .background(selected ? .black.opacity(0) : Color("profile"))
            .cornerRadius(selected ? 0 : 30)
            .overlay {
                if selected {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color("profile"), lineWidth: 2).padding(1)
                }
            }
    }
    var filterBar: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {
                ForEach(self.filterItems, id: \.self) { value in
                    filterItem(value, value == self.filterChoose)
                        .onTapGesture {
                            self.filterChoose = value
                        }
                }
            }
        }
    }
    var content: some View {
        HStack(alignment: .top, spacing: 0) {
            Image("Group20")
                .resizable()
                .frame(width: 40, height: 40)
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 5) {
                            Text("Minted NFT")
                             .foregroundColor(.white)
                            Text("·")
                             .foregroundColor(.white.opacity(0.5))
                            Text("15h ago")
                             .foregroundColor(.white.opacity(0.5))
                            Spacer()
                            Image(systemName: "ellipsis")
                             .foregroundColor(.white)
                             .padding(.trailing, 27)
                    }
                    .font(.SFProDisplayRegular(size: 15))
                    HStack(spacing: 4) {
                        Image("Group14")
                            .resizable()
                            .frame(width: 14, height: 14)
                            .mask(Circle())
                        Text("0x453f...234e2")
                            .font(.SFProDisplayRegular(size: 15))   .foregroundColor(.gray).opacity(0.5)
                    }
                    HStack(spacing: 3) {
                        Image("Group13")
                            .resizable()
                            .frame(width: 14, height: 14)
                            .mask(Circle())
                            Text("standwithcrypto.eth")
                            .font(.SFProDisplayRegular(size: 12)) .foregroundColor(.white)
                        Text("· creator")
                            .font(.SFProDisplayRegular(size: 12))           .foregroundColor(.gray).opacity(0.5)
                    }
                }
                .padding(.leading, 4)
//                Spacer()
                buttonActiovities
                    .padding(.top, 3)
                    .padding(.trailing, 12)
//                Spacer()
                Image("Group7")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .cornerRadius(15)
                    .padding(.trailing, 12)
//                Spacer()
//                Spacer()
                VStack(spacing: 26) {
                    futureActiovities
                    futureActiovities
                }
                .padding(.top, 25)
            }
        }
    }
    var buttonActiovities: some View {
        HStack {
            Image("Group7")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 23, height: 23)
                .cornerRadius(6)
                .padding(.trailing, 5)
            Text("Stand with Crypto")
                .font(.sfProDisplayBold(size: 16))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
        }
        .padding(.vertical, 12)
        .padding(.leading, 20)
        .padding(.trailing, 16)
        .frame(width: .infinity)
        .background(Color("profile"))
        .cornerRadius(15)
        .padding(.leading, 1)
    }
    var futureActiovities: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                Image("Gruop11")
                    .resizable()
                    .frame(width: 40, height: 40)
                VStack(alignment: .leading, spacing: 4) {
                    VStack(spacing: 2) {
                        HStack {
                                Text("Receive")
                                .font(.SFProDisplayRegular(size: 15))
                                .foregroundColor(.white)
                            Spacer()
                                Text("+ 500 AAVE")
                                .font(.SFProDisplayRegular(size: 15))
                                .foregroundColor(.gray.opacity(0.53))
                        }
                        HStack {
                            hederActivity(img: "Group10", text: "", text1: "0x453f...234e2")
                            Spacer()
                            Text("$125.00")
                                .font(.SFProDisplayRegular(size: 15))
                                .foregroundColor(.gray.opacity(0.53))
                        }
                    }
                    HStack(spacing: 4) {
                        Text("01/03/2022")
                            .font(.SFProDisplayRegular(size: 13))
                            .foregroundColor(.gray.opacity(0.53))
                        Text("10:16:25 GMT")
                            .font(.SFProDisplayRegular(size: 13))
                            .foregroundColor(.gray.opacity(0.53))
                        Spacer()
                        Text("Success")
                            .font(.SFProDisplayRegular(size: 13))
                            .foregroundColor(.green)
                    }
                }
            }
        }
        .padding(.trailing, 31)
        .padding(.leading, -30)
    }
    func hederActivity(img: String, text: String, text1: String) -> some View {
        HStack(spacing: 2) {
            Image(img)
                .resizable()
                .frame(width: 14, height: 14)
                .mask(Circle())
            Text(text)
                .font(.system(size: 15))
                .foregroundColor(.white)
            Text(text1)
                .font(.system(size: 15))
                .foregroundColor(.gray).opacity(0.5)
        }
    }
}

struct WalletActivities_Previews: PreviewProvider {
    static var previews: some View {
        WalletActivities()
    }
}

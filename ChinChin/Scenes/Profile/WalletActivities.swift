//
//  WalletActivities.swift
//  ChinChin
//
//  Created by Do Trinh on 26/05/2023.
//

import SwiftUI

struct WalletActivities: View {
    let filterItems = ["ALL", "RECEIVE", "SEND", "SWAP", "READ PACKET", "MINT NFT"]
    
    //MARK: State
    @State var filterChoose = "ALL"
    
}

//MARK: body
extension WalletActivities {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Wallet Activites")
                .font(.system(size: 19))
                .fontWeight(.bold)
                .foregroundColor(.white)
            filterBar
                .padding(.bottom, 23)
            ScrollView(.vertical) {
                content
            }
        }
        .padding(.leading, 23)
        .padding(.top, 26)
        .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
        .background(.black)
    }
}

//MARK: subview
extension WalletActivities {
    
    func filterItem(_ value: String, _ selected: Bool) -> some View {
        Text(value)
            .foregroundStyle(LinearGradient(colors: [Color("pink1"), Color("blue1")], startPoint: .top, endPoint: .bottom))
            .font(.system(size: 13))
            .padding(.horizontal, 30)
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
        ScrollView(.horizontal) {
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
        HStack(alignment: .top) {
            Image("Group20")
                .resizable()
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                HStack(spacing: 6) {
                        Text("Minted NFT")
                         .foregroundColor(.white)
                        Text(".")
                         .foregroundColor(.white.opacity(0.5))
                        Text("15h ago")
                         .foregroundColor(.white.opacity(0.5))
                        Spacer()
                        Image(systemName: "plus")
                         .foregroundColor(.white)
                }
                .font(.system(size: 15))
                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: 4) {
                        Image("Group14")
                            .resizable()
                            .frame(width: 14, height: 14)
                            .mask(Circle())
    //                        Text(text)
    //                            .font(.sfProDisplayBold(size: 12.sp))             .foregroundColor(.white)
                        Text("0x453f...234e2")
                            .font(.system(size: 16))             .foregroundColor(.gray).opacity(0.5)
                    }
                    HStack(spacing: 4) {
                        Image("Group13")
                            .resizable()
                            .frame(width: 14, height: 14)
                            .mask(Circle())
                            Text("standwithcrypto.eth")
                                .font(.system(size: 12))             .foregroundColor(.white)
                        Text(".creator")
                            .font(.sfProDisplayBold(size: 12))             .foregroundColor(.gray).opacity(0.5)
                    }
                }
                buttonActiovities
                Image("Group7")
                    .resizable()
//                    .frame(width: 360, height: 350)
                    .aspectRatio(1, contentMode: .fit)
                    .cornerRadius(15)
                futureActiovities
                    
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
            Text("Stand with Crypto")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "chevron.down")
                .foregroundColor(.white)
        }
        .padding()
        .frame(width: .infinity, height: 40)
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Color("profile"))
        .cornerRadius(15)
    }
    
    var futureActiovities: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                Image("Gruop11")
                    .resizable()
                    .frame(width: 40, height: 40)
                VStack(alignment: .leading) {
                    HStack {
                            Text("Receive")
                            .foregroundColor(.white)
                        Spacer()
                            Text("+ 500 AAVE")
                            .foregroundColor(.gray.opacity(0.53))
                            
                    }
                    .font(.SFProDisplay(size: 15))
                    hederActivity(img: "Group14", text: "", text1: "0x453f...234e2")
                    hederActivity(img: "Group13", text: "standwithcrypto.eth", text1: ". creator")
               
                   
                        
                }
            }
        }
        .padding(.leading, -20)
    }
    
    func hederActivity(img: String, text: String, text1: String) -> some View {
        HStack(spacing: 4) {
            Image(img)
                .resizable()
                .frame(width: 14, height: 14)
                .mask(Circle())
            Text(text)
                .font(.sfProDisplayBold(size: 12))             .foregroundColor(.white)
            Text(text1)
                .font(.sfProDisplayBold(size: 15))             .foregroundColor(.gray).opacity(0.5)
        }
    }
    
}

struct WalletActivities_Previews: PreviewProvider {
    static var previews: some View {
        WalletActivities()
    }
}
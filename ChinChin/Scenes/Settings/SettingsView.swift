//
//  SettingsView.swift
//  ChinChin
//
//  Created by Do Trinh on 15/05/2023.
//

import SwiftUI
struct SettingsView: View{
    @State var isOn = false
}

extension SettingsView {
    var body: some View {
        VStack(spacing: 20) {
            heder
            avata
            streak
            appSecurity
            Spacer()
        }
        .padding(.horizontal, 30)
        .background(.black)
        .edgesIgnoringSafeArea(.bottom)
       
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    private var avata: some View {
        HStack {
            Spacer()
            VStack {
                Image("habit")
                    .resizable()
                    .cornerRadius(15)
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("chindo")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Image("checkmark.seal.fill.blue")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                        Text("Timeles")
                            .foregroundColor(.white).opacity(0.5)
                    }
                    Spacer()
                    Image(systemName: "qrcode.viewfinder")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.white)
                }
                
            }
            .padding()
            .aspectRatio(0.7,contentMode: .fit)
           //dth: UIScreen.main.bounds.width / 2)
            .frame(width: UIScreen.main.bounds.width / 2)
            .background(Color("Color1"))
            .cornerRadius(50)
            Spacer()
        }
    }
}
extension SettingsView {
    private var streak: some View {
        HStack {
            
            VStack (alignment: .leading){
                Text("Hide with phone")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Text("Keep ypu sign in aliver")
                    .foregroundColor(.white).opacity(0.5)
                    .lineLimit(2)
            }
            .frame(maxWidth: .infinity , alignment: .leading)
            Spacer()
            Image("habit")
                .resizable()
                .frame(width: 70, height: 70)
                .cornerRadius(15)
                
            
            
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .background(Color("Color1"))
        .cornerRadius(25)
        
    }
}
extension SettingsView {
    private var appSecurity: some View {
        VStack(alignment: .leading) {
            Text("APP SECURTY")
                .foregroundColor(.white)
                .fontWeight(.bold)
            HStack {
                Toggle(isOn: $isOn) {
                    Text("Hide with phone")
                   
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color("Color1"))
            .cornerRadius(15)
        }
        
       
        
    }
}
extension SettingsView {
    private var heder: some View {
        HStack {
           Image("closeSmall")
                .resizable()
                .frame(width: 30, height: 30, alignment: .leading)
            Spacer()
           
            Text("270")
                .padding()
                .frame(height: 20)
                .foregroundStyle(LinearGradient(colors: [.pink, . green], startPoint: .top, endPoint: .bottom))
                .background(Color("Color1"))
                .cornerRadius(30)
        }
        .frame(maxWidth: .infinity)
    }
}

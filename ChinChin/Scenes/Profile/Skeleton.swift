//
//  Skeleton.swift
//  ChinChin
//
//  Created by Do Trinh on 30/05/2023.
//

import SwiftUI

//Edit
//https://github.com/CSolanaM/SkeletonUI.git
import SkeletonUI

struct Skeleton: View {
    @State var show = true
    var body: some View {
        VStack {
            Text("Hi sfsf                                      ")
                .frame(height: 50)
                .makeSkeleton(with: true)
        }
    }
}

struct Skeleton_Previews: PreviewProvider {
    static var previews: some View {
        Skeleton()
    }
}
//

extension View {
    func makeSkeleton(with: Bool, cornerRadius: Double = 0, color: Color = .gray.opacity(0.5), background: Color = Color("profile")) -> some View {
        self
            .overlay {
                ZStack {
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .skeleton(with: with)
                    .shape(type: .rectangle)
                    .appearance(type: .solid(color: color, background: background))
                    .cornerRadius(cornerRadius)
            }
    }
}

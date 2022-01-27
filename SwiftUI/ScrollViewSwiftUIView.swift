//
//  ScrollViewSwiftUIView.swift
//  IONO_App
//
//  Created by Alexandra Medina on 1/17/22.
//

import SwiftUI
import UIKit

struct ScrollViewSwiftUIView: View {
        
    var body: some View {
       // HStack(spacing:0){
            ScrollView (.horizontal, showsIndicators: false){
                HStack(spacing: 20) {
                    ForEach(User.users){ user in
                        GeometryReader { geometry in
                            CardView(user:user)
                                .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX) / -20), axis: (x: 0, y: 10.0, z: 0))
                        }.frame(width: 300, height: 150)
                    }
                }.padding(40)
                Spacer()
            }.frame(width: UIScreen.main.bounds.width, height: 800)
        
        }
struct ScrollViewSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewSwiftUIView()
    }
}

}

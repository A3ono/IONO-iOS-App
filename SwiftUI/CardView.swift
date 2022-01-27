//
//  CardView.swift
//  IONO_App
//
//  Created by Alexandra Medina on 1/21/22.
//

import SwiftUI

struct CardView: View {
    
    var user : User
    
    var body: some View {
        ZStack{
            Rectangle().fill(Color.red).frame(width: 300, height: 200).cornerRadius(20).shadow(radius: 10)
            
            VStack{
                Text(user.fname).font(.title)
                //Text(user.lname).italic()
                HStack{
                    Text(user.lname)
                }
            }.padding()
        }.frame(width: 300, height: 200)
    }
}
/*
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
 */

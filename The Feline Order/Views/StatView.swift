//
//  StatView.swift
//  The Feline Order
//
//  Created by Alex Gonzalez on 12/16/21.
//

import SwiftUI

struct StatView: View {
    let trait: String
    let val: String
    var body: some View {
        HStack {
            Image(trait).resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 27, height: 27)
            
                .padding(24)
            Text(trait).foregroundColor(Color(0xA5A4AF))
            .font(.system(size: 20, weight: .bold, design: .default))
            Spacer()
            
            Text(val.capitalizingFirstLetter()).foregroundColor(.white)
                .font(.system(size: 18, weight: .medium, design: .default))
                .padding(.trailing, 24)

        }
        .frame(width: UIScreen.screenWidth * 0.90, height: UIScreen.screenHeight * 0.055)
        .background(Color(0x212121))
        .cornerRadius(15)
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView(trait: "Birth Year", val: "2020")
    }
}

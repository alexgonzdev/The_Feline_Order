//
//  CardView.swift
//  The Feline Order
//
//  Created by Alex Gonzalez on 12/15/21.
//

import SwiftUI



struct CardView: View {
    let character: Character
    @State var showDetailScreen: Bool = false

    
    var body: some View {
        
        
        HStack {
            Spacer().frame(width: UIScreen.screenWidth / 30)
            Image(character.name)
            
                .resizable()
                //.scaledToFit()
                .clipShape(Circle())
                .frame(width: 80, height:80)
            
                //.cornerRadius(30)
            
            Spacer().frame(width: 15)

            Text(character.name).foregroundColor(.white)
            .font(.system(size: 20, weight: .medium, design: .default))
            
            Spacer()
            Image("Image")
                .resizable()
            
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
            
            Spacer().frame(width: 20)
                
            
            
        }
        .frame(width: UIScreen.screenWidth / 1.02, height: UIScreen.screenHeight / 8)
        .background(Color(0x1B1B1B))
        
        .cornerRadius(13)
        
        
        .onTapGesture {
            withAnimation {
            showDetailScreen.toggle()
                
            }
        }
        
        
        .popover(isPresented: $showDetailScreen) {
            DetailView(character: character)
                .transition(.scale)
                }
        
        
        
            
        
        
        
    }
}



extension Color {
  init(_ hex: UInt, alpha: Double = 1) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xFF) / 255,
      green: Double((hex >> 8) & 0xFF) / 255,
      blue: Double(hex & 0xFF) / 255,
      opacity: alpha
    )
  }
}


extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}


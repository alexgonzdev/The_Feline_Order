//
//  DetailView.swift
//  The Feline Order
//
//  Created by Alex Gonzalez on 12/16/21.
//

import SwiftUI

struct DetailView: View {
    @State var character: Character
    @State private var showWebView = false

    
    var body: some View {
        ZStack {
            
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .center) {
                    Image(character.name)
                        .resizable()
                    //.scaledToFit()
                        .frame(width: UIScreen.screenWidth * 0.95, height: UIScreen.screenHeight / 3.3, alignment: .center)
                        .cornerRadius(15)
                    
                    Spacer().frame(height: UIScreen.screenHeight /  18)
                    
                    StatView(trait: "Birth Year", val: character.birth_year)
                    StatView(trait: "Gender", val: character.gender)
                    StatView(trait: "Height", val: character.height)
                    StatView(trait: "Mass", val: character.mass)
                    StatView(trait: "Eye Color", val: character.eye_color)
                    StatView(trait: "Hair Color", val: character.hair_color)
                    StatView(trait: "Skin Color", val: character.skin_color)
                
                    HStack {
                        
                        HStack {
                            Image("Learn More")
                                .resizable()
                                .frame(width: 24, height: 24)
                            
                            Text("Learn More").foregroundColor(.white)
                                .font(.system(size: 14, weight: .semibold, design: .default))
                        }
                        .frame(width: UIScreen.screenWidth * 0.40, height: UIScreen.screenHeight * 0.060)
                        .background(Color(0x584A7C))
                        .cornerRadius(15)
                        
                        .onTapGesture {
                            showWebView.toggle()
                        }
                        
                        .sheet(isPresented: $showWebView) {
                            SafariView(url: URL(string: "https://disney.fandom.com/wiki/\(character.name.replacingOccurrences(of: " ", with: "_"))")!)
                        }

                        
                        
}
                }
            }
        }
    }
 
}

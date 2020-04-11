//
//  AboutView.swift
//  Bullseye
//
//  Created by Jayanth Manklu on 10/04/20.
//  Copyright © 2020 lookageek. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    let backgroundColor = Color.init(red: 255.0 / 255.0, green: 214.0 / 255.0, blue: 179.0 / 255.0)
    
    struct TextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .foregroundColor(Color.black)
                .padding(.leading, 60)
                .padding(.trailing, 60)
                .padding(.bottom, 20)
        }
    }
    
    var body: some View {
        Group {
            VStack {
                Text("🎯 Bullseye 🎯")
                    .font(Font.custom("Arial Rounded MT Bold", size: 30))
                    .foregroundColor(Color.black)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider.").modifier(TextStyle()).lineLimit(nil)
                Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score").modifier(TextStyle()).lineLimit(nil)
                Text("Enjoy!").modifier(TextStyle()).lineLimit(nil)
            }
            .navigationBarTitle("About Bullseye")
            .background(backgroundColor)
        }
        .background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}

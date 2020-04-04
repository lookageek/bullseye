//
//  ContentView.swift
//  Bullseye
//
//  Created by Jayanth Manklu on 04/04/20.
//  Copyright © 2020 lookageek. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible: Bool = false
    @State var whoseThereIsVisible: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                Text("Welcome to my first app!")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.green)
                Button(action: {
                    print("Button Pressed!")
                    self.alertIsVisible = true
                }) {
                    Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
                }
                .alert(isPresented: $alertIsVisible) {
                    return Alert(title: Text("Hello there!"), message: Text("This is my first Pop-up"), dismissButton: .default(Text("Awesome!")))
                    
                }
            }
            Button(action: {
                self.whoseThereIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Knock Knock"/*@END_MENU_TOKEN@*/)
                    .fontWeight(.medium)
                    .foregroundColor(Color.red)
            }
            .alert(isPresented: $whoseThereIsVisible) {
                return Alert(title: Text("Who's There?"), message: Text("This is my knock-knock joke"), dismissButton: .default(Text("Get Out!")))
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

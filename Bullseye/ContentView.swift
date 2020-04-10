//
//  ContentView.swift
//  Bullseye
//
//  Created by Jayanth Manklu on 04/04/20.
//  Copyright © 2020 lookageek. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.white)
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
        
        
    }
    
    var body: some View {
        VStack {
            Spacer()
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                    .modifier(LabelStyle())
                Text("\(target)").modifier(LabelStyle())
            }
            Spacer()
            // Slider row
            HStack {
                Text("1").modifier(LabelStyle())
                Slider(value: $sliderValue, in: 1...100)
                Text("100").modifier(LabelStyle())
            }
            Spacer()
            // Button row
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/).modifier(LabelStyle())
            }
            .alert(isPresented: $alertIsVisible) {
                return Alert(title: Text(alertTitle()), message: Text(
                    "The Slider's value is \(sliderValueRounded()).\n" +
                    "You scored \(pointsForCurrentRound()) points this round."
                    ), dismissButton: .default(Text("Awesome!")) {
                        self.score += self.pointsForCurrentRound()
                        self.target = Int.random(in: 1...100)
                        self.round += 1
                    })
            }
            Spacer()
            // Score row
            HStack {
                Button(action: startNewGame) {
                    Text("Start Over").modifier(LabelStyle())
                }
                Spacer()
                Text("Score:").modifier(LabelStyle())
                Text("\(score)").modifier(LabelStyle())
                Spacer()
                Text("Round:").modifier(LabelStyle())
                Text("\(round)").modifier(LabelStyle())
                Spacer()
                Button(action: {}) {
                    Text("Info").modifier(LabelStyle())
                }
            }
            .padding(.bottom, 20)
        }
        .background(Image("Background"), alignment: .top)
    }
    
    func amountOff() -> Int {
        return abs(sliderValueRounded() - target)
    }
    
    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let difference = amountOff()
        let bonus: Int
        if amountOff() == 0 {
            bonus = 100
        } else if amountOff() == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        
        return maximumScore - difference + bonus
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    
    func alertTitle() -> String {
        let difference = amountOff()
        let title: String
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        
        return title
    }
    
    func startNewGame() {
        target = Int.random(in: 1...100)
        score = 0
        round = 1
        sliderValue = 50
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}

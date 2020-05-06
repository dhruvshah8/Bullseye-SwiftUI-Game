//
//  ContentView.swift
//  Bullseye
//
//  Created by Dhruv Shah on 2020-05-05.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var alertIsVisible = false
    @State var siderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var scoreTotal = 0
    @State var round = 1
    let midColour = Color(red: 0.0, green: 51.0, blue: 102.0)
    
    
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.white)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
                .modifier(Shadow())
        }
    }
        
    struct valueStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .foregroundColor(Color.yellow)
            .modifier(Shadow())
            .font(Font.custom("Arial Rounded MT Bold", size: 24))
    }
    }
        
    struct Shadow: ViewModifier {
      func body(content: Content) -> some View {
          return content
            .shadow(color: Color.black, radius: 5, x: 2, y: 2)

      }
        
    }
    
    struct ButtonLargeStyle : ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
                
        }
    }
    
    struct SmallLargeStyle : ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 12))
                
        }
    }
    
    var body: some View {
     
        VStack {
            //Target row
            Spacer()
                 
            HStack {
                Text("Put the Bullseye as you can close to: ").modifier(LabelStyle())
                Text("\(self.target) ").modifier(valueStyle())

            }
            Spacer()
            
            
            
            //Slider Row
            HStack{
                Text("1").modifier(LabelStyle())
                Slider(value: self.$siderValue, in: 1...100).accentColor(midColour)
                Text("100").modifier(LabelStyle())
                
            }
            Spacer()
            
            
            
            //Button Row
            Button(action: {
                self.alertIsVisible = true
                self.scoreTotal = self.scoreTotal + self.pointsForCurrentRound()
            }){
                Text(/*@START_MENU_TOKEN@*/"Hit Me"/*@END_MENU_TOKEN@*/)
            }
            // isPresented - checks if true - becasue it is a state variable it will refresh - () -> closing
            .alert(isPresented: $alertIsVisible){ () -> Alert in
                return Alert(title: Text("Good Shot"), message:
                    Text("You landed on: \(self.siderValue.rounded())." + "You scored: \(self.pointsForCurrentRound()) points this round."), dismissButton: .default(Text("Awesome")) {
                        self.target = Int.random(in: 1...100)
                        self.round = self.round + 1
                    } )
            }
            .background(Image("Button"))
            .modifier(Shadow())
            .modifier(SmallLargeStyle())
            
            Spacer()
            
            
            
            //Score Row
            HStack{
                
                Button(action: {
                    self.scoreTotal = 0
                    self.round = 1
                }) {
                    HStack{
                    Image("StartOverIcon")
                    Text("Start Over:")
                    
                    }
                }
                .background(Image("Button"))
                .modifier(Shadow())
                .modifier(SmallLargeStyle())
                
                Spacer()
                Text("Score:").modifier(LabelStyle())
                Text(" \(scoreTotal)").modifier(valueStyle())
                Spacer()
                Text("Round:").modifier(LabelStyle())
                Text(" \(self.round)").modifier(valueStyle())
                Spacer()
               NavigationLink(destination: AboutView()) {
                    HStack{
                    Image("InfoIcon")
                    Text("Info")
                    }
                }
                .background(Image("Button"))
                .modifier(Shadow())
                .modifier(SmallLargeStyle())
            }
            .padding(.all, 30)
        
        }
        .background(Image("Background"), alignment: .center)
    .navigationBarTitle("Bullseye")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    func pointsForCurrentRound() -> Int {
        let roundedValue = Int(self.siderValue.rounded())
        var difference = self.target - roundedValue
        
        if difference<1 {
            difference = -1 * difference
        }

        if difference ==  0 {
            return 150
        }
        
        else{
            return 100 - difference
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}

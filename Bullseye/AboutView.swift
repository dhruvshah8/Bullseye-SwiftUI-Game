//
//  AboutView.swift
//  Bullseye
//
//  Created by Dhruv Shah on 2020-05-06.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import SwiftUI

let backColor = Color(red: 255.0, green: 214.0, blue: 179.0)

struct headingStyle: ViewModifier {
       func body(content: Content) -> some View {
           return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .padding(.top,20)
                .padding(.bottom,20)
       }
   }

struct textStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
             .foregroundColor(Color.black)
             .font(Font.custom("Arial Rounded MT Bold", size: 16))
             .padding(.leading, 60)
             .padding(.trailing, 60)
             .padding(.bottom,20)
        
    }
}



struct AboutView: View {
    var body: some View {
        Group{
        VStack{
            Text("🎯 Bullseye 🎯").modifier(headingStyle())
            Text("This is Bullseye, the game where you can win points and have fun dragging this interactive slider.").multilineTextAlignment(.center).modifier(textStyle())
        Text("Your goal is to place the slider as close as possible to the target value").modifier(textStyle())
        Text("The closer you are, the more points you will earn.").modifier(textStyle())
        Text("Enjoy!!!").modifier(textStyle())
        }
   // .navigationBarTitle("About Bullseye")
        .background(backColor)
    }
    .background(Image("Background"))
    }

}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
        
    }
}

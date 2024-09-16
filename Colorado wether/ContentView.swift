//
//  ContentView.swift
//  Colorado wether
//
//  Created by Sousa, Tyler - Student on 9/16/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var buttionpressed: Bool = false
    @State private var temp: Int = .random(in: -500...1000)
    
    
    
    var body: some View {
        VStack {
            Image(systemName: "cloud.rain")
                .font(.system(size: 100))
                .foregroundStyle(.tint)
            Text("colorado weather")
                .font(.largeTitle)
                .foregroundStyle(.white)
            Button("click for more info"){
                buttionpressed.toggle()
                temp = Int.random(in: -500...1000)
            }
            
            .padding()
            .background(.white, in: Capsule())
            .foregroundColor(.blue)
            .fontWeight(.medium)
            .fontDesign(.rounded)
            
        }
        .sheet(isPresented: $buttionpressed, content: {
            Text("\(temp)℉")
                .font((.system(size: 50)))
                .fontWeight(.medium)
                .fontDesign(.rounded)
            Text(makeMessage())
                .font(.system(size:25))
                .fontWeight(.light)
                .fontDesign(.rounded)
            Image(systemName: makeIcon())
                .font(.system(size: 75))
        })
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
        .background(LinearGradient(colors: [.white, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
       
    }
        func makeMessage() -> String {
            //make message print to screen based on weather
            var message: String = ""
            if (temp < -70) || (temp > 200) {
                            message = "How tf are you alive?"
            }
            else if temp > 90 {
                message = "wow its hot"
            } else if temp > 60{
                message = "wow its nice out"
            } else if temp > 32{
                message = "wow its brisk"
            } else if temp > 0{
                message = "Bundle up"
            } else if temp >= -50{
                message = "Just move"
            }
            
            return message
            
        }
    
    
    
    func makeIcon() -> String{
        var lcon: String = ""
        if temp > 200 {
            lcon = "sun.max.trianglebadge.exclamationmark.fill"
    }else if temp > 90 {
            lcon = "sun.max.fill"
        } else if temp > 60{
            lcon = "sun.min.fill"
        } else if temp > 32{
            lcon = "wind.snow"
        } else if temp > 0{
            lcon = "cloud.snow.fill"
        } else if temp <= -50{
            lcon = "thermometer.snowflake"
        } else if temp <= -70{
            lcon = "thermometer.snowlake"
        }
        return lcon
    }
}

#Preview {
    ContentView()
}

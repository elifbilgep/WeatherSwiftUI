//
//  WelcomeView.swift
//  WeatherSwiftUI
//
//  Created by Elif Bilge Parlak on 2.07.2023.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager : LocationManager
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Text("Welcome to the Weather App").bold().font(.system(size: 40))
                
                Text("Please share your current location to get the weather in your area").padding( )
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            .shadow(radius: 5)
            
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

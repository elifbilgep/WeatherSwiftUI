//
//  ContentView.swift
//  WeatherSwiftUI
//
//  Created by Elif Bilge Parlak on 2.07.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather : WeatherModel?
    var body: some View {
        VStack {
            if let location = locationManager.location{
                if let weather = weather {
                    WeatherView(weather: weather)
                }else{
                    LoadingView()
                        .task {
                            do{
                                weather =  try await weatherManager.getCurrentWeather(latitude: location.latitude, longitutde: location.longitude)
                            }catch{
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            }else{
                if locationManager.isLoading{
                    LoadingView()
                }else{
                    WelcomeView().environmentObject(locationManager)
                }
            }
        }
        .background(LinearGradient(colors: [Color("veryDarkBlue"), Color("darkBlue"),Color("lightBlue")], startPoint: .leading, endPoint: .bottom))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

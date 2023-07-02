//
//  WeatherView.swift
//  WeatherSwiftUI
//
//  Created by Elif Bilge Parlak on 2.07.2023.
//

import SwiftUI

struct WeatherView: View {
    var weather : WeatherModel
    var body: some View {
        ZStack(alignment:.leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing: 10){
                            Image(systemName: "sun.max" )
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }.frame(width: 150,alignment: .leading)
                        Spacer()
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 70))
                            .fontWeight(.bold)
                            .padding()
                        
                    }
                    Spacer().frame(height: 8)
                    
                    Image("city4")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity,alignment: .leading)
            
            VStack{
                Spacer()
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather Now")
                        .bold()
                        .padding(.bottom)
                    HStack{
                        WeatherRow(logo: "thermometer", name: "Min Temp", value: weather.main.tempMin.roundDouble() + "°")
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max Temp", value: weather.main.tempMax.roundDouble() + "°")
                    }
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed?.roundDouble())! + "m/s")
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidty", value: String(weather.main.humidity ?? 0 ) + "%")
                    }
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
                .padding(.bottom,20)
                .foregroundColor(Color(hue: 0.631, saturation: 0.746, brightness: 0.525))
                .background(Color.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.631, saturation: 0.746, brightness: 0.525))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}

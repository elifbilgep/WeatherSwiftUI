//
//  WeatherManager.swift
//  WeatherSwiftUI
//
//  Created by Elif Bilge Parlak on 2.07.2023.
//

import Foundation
import CoreLocation

class WeatherManager{
    func getCurrentWeather(latitude : CLLocationDegrees , longitutde : CLLocationDegrees) async throws -> WeatherModel{
        let apiKey = "41b5241dd300f5a0019cb4cfa2620f5e"
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude )&lon=\(longitutde)&appid=\(apiKey)&units=metric") else {
            fatalError("Missing URL ")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else{
            fatalError("Error fetching weather data")
        }
        let decodedBody = try JSONDecoder().decode(WeatherModel.self, from: data)
        return decodedBody
    }
}



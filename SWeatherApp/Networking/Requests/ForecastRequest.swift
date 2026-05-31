//
//  ForecastRequest.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 31/05/26.
//


// https://api.open-meteo.com/v1/forecast?latitude=17.3850&longitude=78.4867&current_weather=true

// // https://api.open-meteo.com/v1/forecast?latitude=12.9716&longitude=77.5946&current=temperature_2m,weather_code,wind_speed_10m&hourly=temperature_2m&forecast_days=1&timezone=auto

import Foundation

struct ForecastRequest {
    let latitude: Double
    let longitude: Double
    let timezone: String
    
    init(latitude: Double, longitude: Double, timezone: String = "auto") {
        self.latitude = latitude
        self.longitude = longitude
        self.timezone = timezone
    }
    
    func urlRequest() throws -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.open-meteo.com"
        components.path = "/v1/forecast"
        components.queryItems = [
            URLQueryItem(name: "latitude", value: "\(latitude)"),
            URLQueryItem(name: "longitude", value: "\(longitude)"),
            URLQueryItem(name: "current", value: "temperature_2m,weather_code,wind_speed_10m"),
            URLQueryItem(name: "hourly", value: "temperature_2m"),
            URLQueryItem(name: "forecast_days", value: "1"),
            URLQueryItem(name: "timezone", value: "auto")
        ]
        
        guard let url = components.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 15
        
         return request
    }
}

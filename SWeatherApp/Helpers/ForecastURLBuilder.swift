//
//  ForecastURLBuilder.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 02/05/26.
//

import Foundation
// https://api.open-meteo.com/v1/forecast?latitude=17.3850&longitude=78.4867&current_weather=true


enum ForecastURLBuilder {
    static func makeURL(latitude: Double, longitude: Double) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.open-meteo.com"
        components.path = "/v1/forecast"
        components.queryItems = [
            URLQueryItem(name: "latitude", value: "\(latitude)"),
            URLQueryItem(name: "longitude", value: "\(longitude)"),
            URLQueryItem(name: "current_weather", value: "true")
        ]
        return components.url
    }
}

enum RequestFactory {
    static func makeForecastRequest(latitude: Double, longitude: Double) -> URLRequest? {
        guard let url = ForecastURLBuilder.makeURL(
            latitude: latitude,
            longitude: longitude
        ) else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 15
        return request
    }
}



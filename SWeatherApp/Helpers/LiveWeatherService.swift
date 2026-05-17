//
//  LiveWeatherService.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 17/05/26.
//

import Foundation

enum LiveWeatherService {
    static func fetchWeather(city: String, latitude: Double, longitude: Double) async throws -> WeatherSummary {
        guard let request = RequestFactory.makeForecastRequest(latitude: latitude, longitude: longitude) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response): (Data, URLResponse)
        
        do {
            (data, response) = try await URLSession.shared.data(for: request)
        } catch {
            throw NetworkError.unknown(error)
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.badStatusCode(httpResponse.statusCode)
        }
        
        return try WeatherResponseDecoder.decodeWeatherSummary(from: data, city: city)
    }
}

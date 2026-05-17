//
//  LiveWeatherRepository.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 17/05/26.
//

import Foundation

final class LiveWeatherRepository: WeatherRepository {
    private let forecastAPI: ForecastAPI
    
    init(forecastAPI: ForecastAPI) {
        self.forecastAPI = forecastAPI
    }
    
    func currentWeather(city: String, latitude: Double, longitude: Double) async throws -> WeatherSummary {
        let dto = try await forecastAPI.fetchForecast(latitude: latitude, longitude: longitude)
        return dto.toDomain(city: city)
    }
}

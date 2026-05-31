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
    
    func weatherDashboard(city: String, latitude: Double, longitude: Double) async throws -> WeatherDashboard {
        let dto = try await forecastAPI.fetchForecast(
            latitude: latitude,
            longitude: longitude
        )
        return WeatherDashboard(summary: dto.toSummary(city: city), hourly: dto.toHourlyForecast())
    }
}

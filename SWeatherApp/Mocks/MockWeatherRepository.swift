//
//  MockWeatherRepository.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 31/05/26.
//

import Foundation


final class MockWeatherRepository: WeatherRepository {
    func weatherDashboard(city: String, latitude: Double, longitude: Double) async throws -> WeatherDashboard {
        return WeatherDashboard(summary: WeatherSummary(city: "Bengaluru", temperatureCelsius: 21.5, condition: "Drizzle", windSpeed: 12), hourly: [HourlyForecastPoint(time: .now, temperatureCelcius: 21.5)])
    }
}

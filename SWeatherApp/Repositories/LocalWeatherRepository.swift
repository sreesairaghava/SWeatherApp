//
//  LocalWeatherRepository.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 17/05/26.
//

import Foundation

final class LocalWeatherRepository: WeatherRepository {
    func currentWeather(city: String, latitude: Double, longitude: Double) async throws -> WeatherSummary {
        try LocalWeatherProvider.loadWeather(city: city)
    }
}

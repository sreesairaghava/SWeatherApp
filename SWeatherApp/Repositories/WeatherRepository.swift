//
//  WeatherRepository.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 17/05/26.
//

import Foundation

protocol WeatherRepository {
    func currentWeather(city: String, latitude: Double, longitude: Double) async throws -> WeatherSummary
}

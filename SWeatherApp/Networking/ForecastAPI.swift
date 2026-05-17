//
//  ForecastAPI.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 17/05/26.
//

import Foundation

protocol ForecastAPI {
    func fetchForecast(latitude: Double, longitude: Double) async throws -> ForecastResponseDTO
}

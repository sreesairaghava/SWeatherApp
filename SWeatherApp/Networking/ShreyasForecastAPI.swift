//
//  ShreyasForecastAPI.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 17/05/26.
//

import Foundation

final class ShreyasForecastAPI: ForecastAPI {
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func fetchForecast(latitude: Double, longitude: Double) async throws -> ForecastResponseDTO {
        return ForecastResponseDTO(current: CurrentDTO(time: "", temperature: 21, weatherCode: 2, windSpeed: 30), hourly: HourlyDTO(time: [], temperature: []))
    }
}

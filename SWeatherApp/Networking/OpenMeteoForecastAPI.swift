//
//  OpenMeteoForecastAPI.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 17/05/26.
//

import Foundation

final class OpenMeteoForecastAPI: ForecastAPI {
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func fetchForecast(latitude: Double, longitude: Double) async throws -> ForecastResponseDTO {
        let request = try ForecastRequest(latitude: latitude, longitude: longitude).urlRequest()
        
        let data = try await httpClient.data(for: request)
        
        do {
            return try JSONDecoder().decode(ForecastResponseDTO.self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }
    
}

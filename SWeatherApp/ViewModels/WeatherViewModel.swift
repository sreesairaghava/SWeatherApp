//
//  WeatherViewModel.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 02/05/26.
//

import Foundation

@MainActor
@Observable
final class WeatherViewModel {
    var summary: WeatherSummary = .init(
        city: "-",
        temperatureCelsius: 0,
        condition: "-",
        windSpeed: 0
    )
    var errorMessage: String?
    
    func loadLocalSample() {
        do {
            errorMessage = nil
            summary = try LocalWeatherProvider.loadWeather(city: "Bengaluru")
        } catch {
            errorMessage = (error as? LocalizedError)?.errorDescription ?? "Unkown error."
        }
    }
}

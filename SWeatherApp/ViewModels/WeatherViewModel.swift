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
    var isLoading = false
    var cityName = "Bengaluru"
    var latitudeText = "12.9716"
    var longitudeText = "77.5946"
    
    func loadLocalSample() {
        do {
            errorMessage = nil
            summary = try LocalWeatherProvider.loadWeather(city: "Bengaluru")
        } catch {
            errorMessage = (error as? LocalizedError)?.errorDescription ?? "Unkown error."
        }
    }
    
    func loadLiveWeather() async {
        guard let latitude = Double(latitudeText),
              let longitude = Double(longitudeText) else {
            errorMessage = "Enter valid latitude and longitude values."
            return
        }
        
        isLoading = true
        errorMessage = nil
        do {
            summary = try await LiveWeatherService.fetchWeather(
                city: cityName,
                latitude: latitude,
                longitude: longitude
            )
        } catch {
            errorMessage = (error as? LocalizedError)?.errorDescription ?? "Unknown error."
        }
        isLoading = false
    }
}

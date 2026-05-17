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
    
    private let liveWeatherRepository: LiveWeatherRepository
    private let localWeatherRepository: LocalWeatherRepository
    
    init(liveWeatherRepository: LiveWeatherRepository, localWeatherRepository: LocalWeatherRepository) {
        self.liveWeatherRepository = liveWeatherRepository
        self.localWeatherRepository = localWeatherRepository
    }
    
    func loadLocalSample() {
        Task {
            do {
                errorMessage = nil
                summary = try await localWeatherRepository.currentWeather(
                    city: cityName,
                    latitude: 0,
                    longitude: 0)
            }
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
            summary = try await liveWeatherRepository.currentWeather(
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

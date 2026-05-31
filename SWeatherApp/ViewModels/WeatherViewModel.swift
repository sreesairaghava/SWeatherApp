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
    var state: WeatherViewState = .idle
    
    var cityName = "Bengaluru"
    var latitudeText = "12.9716"
    var longitudeText = "77.5946"
    
    private let weatherRepository: WeatherRepository
    
    init(weatherRepository: WeatherRepository) {
        self.weatherRepository = weatherRepository
    }
    
    func loadLiveWeather() async {
        guard let latitude = Double(latitudeText),
              let longitude = Double(longitudeText) else {
            state = .failed("Enter valid latitude and longitude values.")
            return
        }
        
        state = .loading
        do {
            let dashboard = try await weatherRepository.weatherDashboard(
                city: cityName,
                latitude: latitude,
                longitude: longitude
            )
            state = .loaded(dashboard)
        } catch {
            state = .failed((error as? LocalizedError)?.errorDescription ?? "Unknown error.")
        }
    }
}

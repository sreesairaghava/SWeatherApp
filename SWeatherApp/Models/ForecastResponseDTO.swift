//
//  ForecastResponseDTO.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 03/05/26.
//

import Foundation

// Data Transfer Object
struct ForecastResponseDTO: Decodable {
    let current: CurrentDTO
    enum CodingKeys: String, CodingKey {
        case current = "current_weather"
    }
}

struct CurrentDTO: Decodable {
    let temperature: Double
    let weatherCode: Int
    let windSpeed: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature
        case weatherCode = "weathercode"
        case windSpeed = "windspeed"
    }
}

extension ForecastResponseDTO {
    func toDomain(city: String) -> WeatherSummary {
        WeatherSummary(
            city: city,
            temperatureCelsius: current.temperature,
            condition:WeatherCodeMapper.text(for: current.weatherCode),
            windSpeed: current.windSpeed
        )
    }
}

enum WeatherCodeMapper {
    static func text(for code: Int) -> String {
        switch code {
        case 0:
            return "Clear sky"
        case 1:
            return "Mainly clear"
        case 2:
            return "Partly cloudy"
        case 3:
            return "Overcast"
        case 45, 48:
            return "Fog"
        case 51, 53, 55:
            return "Drizzle"
        case 61, 63, 65:
            return "Rain"
        case 71, 73, 75:
            return "Snow"
        case 80, 81, 82:
            return "Rain showers"
        case 95:
            return "Thunderstorm"
        default:
            return "Unknown"
        }
    }
}

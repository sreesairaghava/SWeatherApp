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
            return "Clear Sky"
        case 1:
            return "Few Clouds"
        case 2:
            return "Shreyas is doing great"
        case 3:
            return "Broken Clouds"
        case 4:
            return "Overcast Clouds"
        case 5:
            return "Mist"
        default:
            return "Unknown"
        }
    }
}

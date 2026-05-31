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
    let hourly: HourlyDTO
}

struct CurrentDTO: Decodable {
    let time: String
    let temperature: Double
    let weatherCode: Int
    let windSpeed: Double
    
    enum CodingKeys: String, CodingKey {
        case time
        case temperature = "temperature_2m"
        case weatherCode = "weather_code"
        case windSpeed = "wind_speed_10m"
    }
}

struct HourlyDTO: Decodable {
    let time: [String]
    let temperature: [Double]
    
    enum CodingKeys: String, CodingKey {
        case time
        case temperature = "temperature_2m"
    }
}

extension ForecastResponseDTO {
    func toSummary(city: String) -> WeatherSummary {
        WeatherSummary(
            city: city,
            temperatureCelsius: current.temperature,
            condition:WeatherCodeMapper.text(for: current.weatherCode),
            windSpeed: current.windSpeed
        )
    }
    
    func toHourlyForecast() -> [HourlyForecastPoint] {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        formatter.locale = Locale(identifier: "en_US_POSIX")

        return zip(hourly.time, hourly.temperature).compactMap { time, temperature -> HourlyForecastPoint? in
            guard let date = formatter.date(from: time) else { return nil }

            return HourlyForecastPoint(
                time: date,
                temperatureCelcius: temperature
            )
        }
    }}

// Example: [(31-05-2026 1:00 : 22.5), (31-05-2026 2:00 : 21.5), (31-05-2026 3:00 : 19.5)]

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

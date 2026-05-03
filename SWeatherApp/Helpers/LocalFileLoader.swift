//
//  LocalFileLoader.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 03/05/26.
//

import Foundation

enum LocalFileLoader {
    static func loadData(fileName: String, fileExtension: String = "json") throws -> Data {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            throw LocalDataError.fileNotFound(fileName: fileName, fileExtension: fileExtension)
        }
        do {
            return try Data(contentsOf: url)
        } catch {
            throw LocalDataError.readFailed(underlying: error)
        }
    }
}


enum LocalDataError: LocalizedError {
    case fileNotFound(fileName: String, fileExtension: String)
    case readFailed(underlying: Error)
    case decodeFailed(underlying: Error)
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound(let fileName, let fileExtension):
            return "Could not find \(fileName).\(fileExtension) in app bundle."
        case .readFailed:
            return "Could not read the data"
        case .decodeFailed:
            return "Could not decode the weather JSON"
        }
    }
}

enum LocalWeatherDecoder {
    static func decodeWeatherSummary(from data: Data, city: String) throws -> WeatherSummary {         do {
            let dto = try JSONDecoder().decode(ForecastResponseDTO.self, from: data)
            return dto.toDomain(city: city)
        } catch {
            throw LocalDataError.decodeFailed(underlying: error)
        }
    }
}

enum LocalWeatherProvider {
    static func loadWeather(city: String) throws -> WeatherSummary {
        let data = try LocalFileLoader.loadData(fileName: "forecast_sample")
        return try LocalWeatherDecoder.decodeWeatherSummary(from: data, city: city)
    }
}

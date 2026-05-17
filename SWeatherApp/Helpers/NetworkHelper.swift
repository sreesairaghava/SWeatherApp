//
//  NetworkHelper.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 17/05/26.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case badStatusCode(Int)
    case decodingFailed
    case unknown(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Could not create a valid URL."
        case .invalidResponse:
            return "The server returned an invalid response."
        case .badStatusCode(let statusCode):
            return "The server returned status code \(statusCode)."
        case .decodingFailed:
            return "Could not decode the weather response."
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}

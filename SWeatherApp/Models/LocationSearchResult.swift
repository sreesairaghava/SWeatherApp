//
//  LocationSearchResult.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 17/05/26.
//

import Foundation

struct LocationSearchResult: Identifiable, Equatable {
    let id: Int
    let name: String
    let country: String
    let admin1: String?
    let latitude: Double
    let longitude: Double
    let timezone: String
    
    var displayName: String {
        [name, admin1, country]
            .compactMap { value in
                guard let value, !value.isEmpty else { return nil }
                return value
            }
            .joined(separator: ", ")
    }
}

//
//  GeocodingResponseDTO.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 17/05/26.
//

import Foundation

struct GeocodingResponseDTO: Decodable {
    
}

struct GeocodingResultDTO: Decodable {
    let id: Int
    let name: String
    let latitude: Double
    let longitude: Double
    let timezone: String
    let country: String
    let admin1: String?
    
    func toDomain() -> LocationSearchResult {
        LocationSearchResult(id: id,
                             name: name,
                             country: country,
                             admin1: admin1,
                             latitude: latitude,
                             longitude: longitude,
                             timezone: timezone
        )
    }
}

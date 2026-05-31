//
//  WeatherDashboard.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 17/05/26.
//

import Foundation

struct WeatherDashboard: Equatable {
    let summary: WeatherSummary
    let hourly: [HourlyForecastPoint]
//    let location: LocationSearchResult
}

//
//  HourlyForecastPoint.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 17/05/26.
//

import Foundation

struct HourlyForecastPoint: Identifiable, Equatable {
    let id = UUID()
    let time: Date
    let temperatureCelcius: Double
}

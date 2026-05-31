//
//  CurrentWeatherView.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 31/05/26.
//

import SwiftUI

struct CurrentWeatherView: View {
    let summary: WeatherSummary
    var body: some View {
        VStack(spacing: 14) {
            Text(summary.city)
                .font(.title2.bold())
                .multilineTextAlignment(.center)
            
            Text("\(summary.temperatureCelsius, specifier: "%.1f") °C")
                            .font(.system(size: 52, weight: .semibold, design: .rounded))
            
            Text(summary.condition)
                .font(.headline)
                .foregroundStyle(.secondary)
            Divider()
            WeatherStatRow(title: "Windspeed", value: "\(summary.windSpeed, default: "%.1f") km/h")

        }
        .cardStyle()
    }
}

#Preview {
    CurrentWeatherView(summary: .init(city: "Hyderabad", temperatureCelsius: 34.5, condition: "Humid", windSpeed: 12))
}

//
//  WeatherDashboardTab.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 31/05/26.
//

import SwiftUI

enum WeatherDashboardTab: String, CaseIterable, Identifiable {
    case current = "Current"
    case hourly = "Hourly"
    
    var id: String { rawValue }
}

struct WeatherDashboardTabs: View {
    let dashboard: WeatherDashboard
    @State private var selectedTab: WeatherDashboardTab = .current
    var body: some View {
        VStack(spacing: 16) {
            Picker("Weather Selection", selection: $selectedTab) {
                ForEach(WeatherDashboardTab.allCases) { tab in
                    Text(tab.rawValue).tag(tab)
                }
            }
            .pickerStyle(.segmented)
            switch selectedTab {
            case .current:
                CurrentWeatherView(summary: dashboard.summary)
            case .hourly:
                HourlyForecastView(points: dashboard.hourly)
            }
        }
    }
}

#Preview {
    WeatherDashboardTabs(dashboard: .init(summary: WeatherSummary(city: "BLR", temperatureCelsius: 21.5, condition: "Drizzle", windSpeed: 10), hourly: [HourlyForecastPoint(time: .now, temperatureCelcius: 20), HourlyForecastPoint(time: .now, temperatureCelcius: 21)]))
}

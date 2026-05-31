//
//  HourlyForecastView.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 31/05/26.
//


import SwiftUI

struct HourlyForecastView: View {
    let points: [HourlyForecastPoint]

    private var nextFewHours: [HourlyForecastPoint] {
        Array(points.prefix(8))
    }

    var body: some View {
        VStack(spacing: 16) {
            HourlyTemperatureChartView(points: points)

            VStack(spacing: 10) {
                ForEach(nextFewHours) { point in
                    HStack {
                        Text(point.time, format: .dateTime.hour().minute())
                            .foregroundStyle(.secondary)

                        Spacer()

                        Text("\(point.temperatureCelcius, specifier: "%.1f") °C")
                            .fontWeight(.semibold)
                    }
                    .font(.subheadline)
                }
            }
            .cardStyle()
        }
    }
}

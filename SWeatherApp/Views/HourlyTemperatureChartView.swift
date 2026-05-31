//
//  HourlyTemperatureChartView.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 31/05/26.
//


import SwiftUI
import Charts

struct HourlyTemperatureChartView: View {
    let points: [HourlyForecastPoint]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Hourly Temperature")
                .font(.headline)

            Chart(points) { point in
                AreaMark(
                    x: .value("Time", point.time),
                    y: .value("Temperature", point.temperatureCelcius)
                )
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .orange.opacity(0.35),
                            .orange.opacity(0.05)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )

                LineMark(
                    x: .value("Time", point.time),
                    y: .value("Temperature", point.temperatureCelcius)
                )
                .foregroundStyle(.orange)
                .lineStyle(StrokeStyle(lineWidth: 3))
                .interpolationMethod(.catmullRom)

                PointMark(
                    x: .value("Time", point.time),
                    y: .value("Temperature", point.temperatureCelcius)
                )
                .foregroundStyle(.orange)
            }
            .frame(height: 240)
            .chartXAxis {
                AxisMarks(values: .stride(by: .hour, count: 4)) { _ in
                    AxisGridLine()
                    AxisTick()
                    AxisValueLabel(format: .dateTime.hour())
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
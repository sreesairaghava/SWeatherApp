//
//  ContentView.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 02/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel: WeatherViewModel = .init()
    var body: some View {
        VStack(spacing: 12) {
            Text(viewModel.summary.city)
                .font(.title.bold())
            Text("\(viewModel.summary.temperatureCelsius, specifier: "%.2f") °C")
                .font(.system(size: 42, weight: .semibold, design: .rounded))
            Text(viewModel.summary.condition)
                .font(.headline)
                .foregroundStyle(.secondary)
            HStack {
                Text("WindSpeed")
                    .font(.caption)
                Spacer()
                Text("\(viewModel.summary.windSpeed, specifier: "%.2f") km/h")
                    .font(.caption)
            }
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundStyle(.red)
            }
            Button("Reload Local JSON") {
                viewModel.loadLocalSample()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .onAppear() {
            viewModel.loadLocalSample()
        }
    }
}

#Preview {
    ContentView()
}

//
//  WeatherInputCard.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 31/05/26.
//

import SwiftUI

struct WeatherInputCard: View {
    @Bindable var viewModel: WeatherViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Request Input")
                .font(.headline)
            TextField("City Display Name", text: $viewModel.cityName)
                .textFieldStyle(.roundedBorder)
            HStack(spacing: 12) {
                TextField("Latitude", text: $viewModel.latitudeText)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)
                TextField("Longitude", text: $viewModel.longitudeText)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)
            }
            Text("Weather is fetched using latitude and longitude. City name is used for display until geocoding is added.")
                .font(.caption)
                .foregroundStyle(.secondary)
            
            Button {
                Task {
                    await viewModel.loadLiveWeather()
                }
            } label: {
                Text("Fetch Weather")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .cardStyle()
    }
}

#Preview {
    WeatherInputCard(viewModel: WeatherViewModel(weatherRepository: MockWeatherRepository()))
}

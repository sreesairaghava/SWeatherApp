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
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // weather result
                    weaterResultSection
                    // input
                    inputSection
                    // action section
                    actionSection
                }
                .padding()
            }
            .navigationTitle("Weather")
            .onAppear {
                viewModel.loadLocalSample()
            }
        }
    }
    private var weaterResultSection: some View {
        VStack(spacing: 12) {
            Text(viewModel.summary.city)
                .font(.title.bold())
            
            Text("\(viewModel.summary.temperatureCelsius, specifier: "%.2f") °C")
                .font(.system(size: 44, weight: .semibold, design: .rounded))
            
            Text(viewModel.summary.condition)
                .font(.headline)
                .foregroundStyle(.secondary)
            
            HStack {
                Text("Wind Speed")
                Spacer()
                Text("\(viewModel.summary.windSpeed, specifier: "%.2f") Km/h")
                    .fontWeight(.semibold)
            }
            .font(.subheadline)
            
            if viewModel.isLoading {
                ProgressView("Fetcing the live weather data...")
            }
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .font(.footnote)
                    .foregroundStyle(.red)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    private var inputSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Request Input")
                .font(.headline)
            TextField("City display name", text: $viewModel.cityName)
                .textFieldStyle(.roundedBorder)
            
            TextField("Latitude", text: $viewModel.latitudeText)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
            
            TextField("Longitude", text: $viewModel.longitudeText)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
            
            Text("City name is only used for display right now. \nLatitude and longitude are used to fetch the weather.")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    private var actionSection: some View {
        VStack(spacing: 12) {
            Button {
                Task {
                    await viewModel.loadLiveWeather()
                }
            } label: {
                Text("Fetch Live Weather")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .disabled(viewModel.isLoading)
            
            Button {
                viewModel.loadLocalSample()
            } label: {
                Text("Load Local JSON")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    ContentView()
}

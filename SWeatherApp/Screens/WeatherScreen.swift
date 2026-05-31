//
//  WeatherScreen.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 31/05/26.
//

import SwiftUI

struct WeatherScreen: View {
    @State var viewModel: WeatherViewModel
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    // Weather Input Card
                    WeatherInputCard(viewModel: viewModel)
                    switch viewModel.state {
                    case .idle:
                        EmptyWeatherStateView()
                    case .loading:
                        LoadingWeatherView()
                    case .loaded(let dashboard):
                        WeatherDashboardTabs(dashboard: dashboard)
                    case .failed(let message):
                        ErrorWeatherView(message: message)
                    }
                }
                .padding()
            }
            .navigationTitle("Weather App")
        }
    }
}

#Preview {
    WeatherScreen(viewModel: WeatherViewModel(weatherRepository: MockWeatherRepository()))
}

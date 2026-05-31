//
//  ContentView.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 02/05/26.
//

import SwiftUI

struct ContentView: View {
    private let viewModel: WeatherViewModel
    
    init() {
        let httpClient = URLSessionHTTPClient()
        let forecastAPI = OpenMeteoForecastAPI(httpClient: httpClient)
        let weatherRepository = LiveWeatherRepository(forecastAPI: forecastAPI)
        
        self.viewModel = WeatherViewModel(weatherRepository: weatherRepository)
    }
    var body: some View {
        WeatherScreen(viewModel: viewModel)
    }
}

#Preview {
    ContentView()
}

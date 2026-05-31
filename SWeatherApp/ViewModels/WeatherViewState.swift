//
//  WeatherViewState.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 31/05/26.
//


enum WeatherViewState {
    case idle
    case loading
    case loaded(WeatherDashboard)
    case failed(String)
}

//
//  EmptyWeatherStateView.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 31/05/26.
//

import SwiftUI

struct EmptyWeatherStateView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "cloud.sun")
                .font(.system(size: 44))
                .foregroundStyle(.secondary)
            
            Text("Enter coordinates to load weather.")
                .font(.headline)
            
            Text("The current weather and hourly forecasts will be displayed here.")
                .font(.caption)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    EmptyWeatherStateView()
}

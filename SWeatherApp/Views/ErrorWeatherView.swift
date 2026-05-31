//
//  ErrorWeatherView.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 31/05/26.
//

import SwiftUI

struct ErrorWeatherView: View {
    let message: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Something went wrong")
                .font(.headline)
            Text(message)
                .font(.footnote)
                .foregroundStyle(.red)

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .cardStyle()
    }
}

#Preview {
    ErrorWeatherView(message: "Failed to load weather data")
}

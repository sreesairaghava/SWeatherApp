//
//  WeatherStatRow.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 31/05/26.
//

import SwiftUI

struct WeatherStatRow: View {
    let title: String
    let value: String
    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(.secondary)
            Spacer()
            Text(value)
                .fontWeight(.semibold)
        }
        .font(.subheadline)
    }
}

#Preview {
    WeatherStatRow(title: "Windspeed", value: "15 km/h")
}

//
//  LoadingWeatherView.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 31/05/26.
//

import SwiftUI

struct LoadingWeatherView: View {
    var body: some View {
        VStack(spacing: 12) {
            ProgressView()
            Text("Fetching live weather...")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .cardStyle()
    }
}

#Preview {
    LoadingWeatherView()
}

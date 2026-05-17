//
//  HTTPClient.swift
//  SWeatherApp
//
//  Created by Sree Sai Raghava Dandu on 17/05/26.
//

import Foundation

protocol HTTPClient {
    func data(for request: URLRequest) async throws -> Data
}

//
//  WeatherData.swift
//  ClimaSwiftUI
//
//  Created by Abhishek Babladi on 2023-02-26.
//

import Foundation

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}

struct Coordinate: Codable {
    let lat: Double
    let lon: Double
}

struct WeatherInfo: Codable {
    let coord: Coordinate
    let name: String
    let main: Main
    let weather: [Weather]
}

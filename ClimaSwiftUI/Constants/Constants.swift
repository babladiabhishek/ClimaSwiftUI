//
//  Constants.swift
//  ClimaSwiftUI
//
//  Created by Abhishek Babladi on 2023-02-26.
//

import Foundation

struct Constants {
    static let baseUrl = "https://api.openweathermap.org/data/2.5/weather"
    static let apiKey = "8ff5b09bab55f8f7987c4508b287962f"
    struct Urls {
        static func getLatLonUrl(lat: Double, lon: Double) -> URL {
            let urlString = "\(baseUrl)?lat=\(lat)&lon=\(lon)&appid=\(apiKey)"
            let url = URL(string: urlString)!
            return url
        }
        static func getWeatherUrl(cityName: String) -> URL {
            let cityQuery = "q=\(cityName)"
            let urlString = "\(baseUrl)?\(cityQuery)&appid=\(apiKey)"
            let url = URL(string: urlString)!
            return url
        }
    }
}

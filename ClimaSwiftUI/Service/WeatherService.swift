//
//  WeatherService.swift
//  ClimaSwiftUI
//
//  Created by Abhishek Babladi on 2023-02-26.
//

import Foundation
import Combine

class WeatherService {

    func getWeatherForCity(cityName: String) -> AnyPublisher<WeatherInfo, Error> {
         let url = Constants.Urls.getWeatherUrl(cityName: cityName)

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: WeatherInfo.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    func getWeatherForLocation(lat: Double, lon: Double) -> AnyPublisher<WeatherInfo, Error> {
         let url = Constants.Urls.getLatLonUrl(lat: lat, lon: lon)

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: WeatherInfo.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

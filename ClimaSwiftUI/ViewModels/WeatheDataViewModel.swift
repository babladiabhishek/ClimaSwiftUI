//
//  WeatheDataViewModel.swift
//  ClimaSwiftUI
//
//  Created by Abhishek Babladi on 2023-02-26.
//

import Foundation
import Combine
import CoreLocation

class WeatherDataViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {

    @Published var location: CLLocation?
    @Published var error: Error?
    @Published  var data: WeatherInfoViewModel?

    private let locationManager = CLLocationManager()
    private let session = URLSession.shared
    private var cancellable: AnyCancellable?

    init(cancellable: AnyCancellable? = nil) {
        self.cancellable = cancellable
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }

    func fetchCityWeatherData(cityName: String) {
        self.cancellable = WeatherService()
            .getWeatherForCity(cityName: cityName).map {
                WeatherInfoViewModel(weatherInfo: $0)
            }.sink { _ in}
    receiveValue: { weatherInfoViewModel in
        DispatchQueue.main.async {
            self.data = weatherInfoViewModel
        }
    }
    }

    func fetchWeatherData(lat: Double, lon: Double) {
        self.cancellable =
        WeatherService()
            .getWeatherForLocation(lat: lat, lon: lon).map { WeatherInfoViewModel(weatherInfo: $0) }
            .sink { _ in}
    receiveValue: { weatherInfoViewModel in
        DispatchQueue.main.async {
            self.data = weatherInfoViewModel
        }
    }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            self.location = location
            fetchWeatherData(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.error = error
    }

    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }

    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }
}

struct WeatherInfoViewModel {

    let weatherInfo: WeatherInfo

    var conditionId: Int {
        weatherInfo.weather.first!.id
    }
    var cityName: String {
        weatherInfo.name
    }
    var temperature: Double {
        weatherInfo.main.temp
    }

    var temperatureString: String {
        return String(format: "%.f", temperature)
    }

    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }

}

//
//  LocationManager.swift
//  ClimaSwiftUI
//
//  Created by Abhishek Babladi on 2023-02-25.
//

import Foundation
import CoreLocation
import SwiftUI
import Combine

class WeatherViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {

    private let locationManager = CLLocationManager()
    private let session = URLSession.shared

    @Published var location: CLLocation?
    @Published var weatherData: WeatherInfo?
    @Published var error: Error?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            self.location = location
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

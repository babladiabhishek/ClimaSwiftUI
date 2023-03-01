//
//  ContentView.swift
//  ClimaSwiftUI
//
//  Created by Abhishek Babladi on 2023-02-26.
//

import SwiftUI
import Combine

struct LandingView: View {
    @ObservedObject var viewModel = WeatherDataViewModel()
    @State private var searchQuery: String = ""
    var body: some View {
        DefaultBackground {
            VStack(alignment: .center, spacing: 100) {
                VStack {
                    SearchBar(text: $searchQuery)
                }
                .onReceive(Just(searchQuery)) { query in
                    if !query.isEmpty {
                        viewModel.fetchCityWeatherData(cityName: query)
                    }
                }
                Spacer()
                if viewModel.data != nil {
                    VStack(alignment: .center) {
                        Image(systemName: viewModel.data!.conditionName)
                            .resizable()
                            .aspectRatio( contentMode: .fill)
                            .frame(width: 100, height: 100)
                        HStack {
                            Text(viewModel.data!.temperatureString) + Text("°")
                            Text("K")
                        }
                        Text(viewModel.data!.cityName)
                    }
                    .font(Font.custom("Helvetica", size: 50))
                    .foregroundColor(Color.white)
                    .padding()
                } else {
                    Text("Loading")
                }
                Spacer()
            }
        }
        .onAppear {
            viewModel.startUpdatingLocation()
        }
        .onDisappear {
            viewModel.stopUpdatingLocation()
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}

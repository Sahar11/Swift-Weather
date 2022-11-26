//
//  WeatherManager.swift
//  Swift-weather
//
//  Created by Sahar.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=cd2e2367030a1009b470e8c49ad5bb84"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
}

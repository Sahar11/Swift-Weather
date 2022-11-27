//
//  WeatherData.swift
//  Swift-weather
//
//  Created by Sahar.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    
    struct Main: Decodable {
        let temp: Double
    }
    
    struct Weather: Decodable {
        let description: String
        let id: Int
    }
    
}

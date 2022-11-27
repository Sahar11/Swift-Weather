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
    func performRequest(urlString: String) {
        // Create URL
        
        if  let url = URL(string: urlString) {
            // create URL session
            let session = URLSession(configuration: .default)
            
            //give session a task
            let task =  session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                    print("This is response")
                    print(dataString!)
                }
            }
            
            // start the task
            task.resume()
            
        }
    }
    
}

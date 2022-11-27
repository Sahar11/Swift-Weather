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
        performRequest(urlString: urlString)
    }
    
    // Get data
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
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            // start the task
            task.resume()
            
        }
    }
    
    // parse data
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            print(getConditionName(weatherId: id))
        } catch {
            print(error)
        }
    }
    
    func getConditionName(weatherId: Int) -> String {
        switch weatherId {
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

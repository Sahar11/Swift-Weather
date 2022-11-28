//
//  WeatherManager.swift
//  Swift-weather
//
//  Created by Sahar.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=cd2e2367030a1009b470e8c49ad5bb84"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    var delegate: WeatherManagerDelegate?
    
    // Get data
    func performRequest(with urlString: String) {
        // Create URL
        
        if  let url = URL(string: urlString) {
            // create URL session
            let session = URLSession(configuration: .default)
            
            //give session a task
            let task =  session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather =  self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            // start the task
            task.resume()
            
        }
    }
    
    // parse data
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            print(weather.conditionName)
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
   
    
    
}

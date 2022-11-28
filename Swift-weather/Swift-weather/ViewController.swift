//
//  ViewController.swift
//  Swift-weather
//
//  Created by Sahar.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        
        searchTextField.delegate = self
    }
}

//MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        //print(searchTextField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    // if user doesn't enter anything
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    // after user pressess the search button the text field should be empty
    func textFieldDidEndEditing(_ textField: UITextField) {
        //use searchTextField.text to get the weather for that city
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
}
//MARK: - WeatherManagerDelegate
extension ViewController: WeatherManagerDelegate {
    
      func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
          DispatchQueue.main.async {
              self.temperatureLabel.text = weather.temperatureString
              self.conditionImageView.image = UIImage(systemName: weather.conditionName)
      }
          
      }
      
      func didFailWithError(error: Error) {
          print(error)
      }
}

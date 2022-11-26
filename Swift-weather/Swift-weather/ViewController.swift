//
//  ViewController.swift
//  Swift-weather
//
//  Created by Dawn Apple on 2022-11-24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
    }


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
        searchTextField.text = ""
    }
}


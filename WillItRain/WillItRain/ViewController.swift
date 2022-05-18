//
//  ViewController.swift
//  WillItRain
//
//  Created by Geena Deierl on 16/5/2022.
//

import UIKit

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var locationSearchTextField: UITextField!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet var iconImage: UIImageView!
    
    var weatherManager = WeatherManager()
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //displays weather information for the last searched city
        let defaults = UserDefaults.standard
        tempLabel.text = String(defaults.double(forKey: "WEATHER_INFORMATION_TEMP"))
        minTempLabel.text = String(defaults.double(forKey: "WEATHER_INFORMATION_TEMPMIN"))
        maxTempLabel.text = String(defaults.double(forKey: "WEATHER_INFORMATION_TEMPMAX"))
        //iconImage.image = UIImage(named: String(defaults.string(forKey: "WEATHER_INFORMATION_ICON") ?? "no icon"))
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        if let city = locationSearchTextField.text {
            weatherManager.fetchWeather(cityName: city)
            sleep(2) //delays the display so that the method^ can finish running and update befrore displaying the information on the screen

            let defaults = UserDefaults.standard
            tempLabel.text = String(defaults.double(forKey: "WEATHER_INFORMATION_TEMP"))
            minTempLabel.text = String(defaults.double(forKey: "WEATHER_INFORMATION_TEMPMIN"))
            maxTempLabel.text = String(defaults.double(forKey: "WEATHER_INFORMATION_TEMPMAX"))
            
            let weatherIcon = String(defaults.string(forKey: "WEATHER_INFORMATION_ICON") ?? "no icon")
            print("weather icon is \(weatherIcon)")
            
            iconImage.image = UIImage(named: weatherIcon)
        }
    }
}

//
//  RecommendationsViewController.swift
//  WillItRain
//
//  Created by Geena Deierl on 16/5/2022.
//

import UIKit

class RecommendationsViewController: UIViewController {

    
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var recommendationDescriptionLabel: UILabel!
    @IBOutlet weak var wetWeatherLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let feelsLikeTemp = defaults.double(forKey: "WEATHER_INFORMATION_FEELSLIKE")
        feelsLikeLabel.text = String(feelsLikeTemp)
        
        var shouldWear: String
        switch (feelsLikeTemp){
        case 0...16:
            shouldWear = "Wear a jacket!"
        case 26...40:
            shouldWear = "Stay cool, it's warm out"
        default:
            shouldWear = "Idk, wear what makes you smile:)"
        }
        recommendationDescriptionLabel.text = shouldWear
        
        let weatherConditions = defaults.string(forKey: "WEATHER_INFORMATION_CONDITIONS")
        
        var willItRain: String = ""
        if (weatherConditions!.contains("rain")){ //checks if rain is mentioned in the weather description
            willItRain = "Bring an umbrella!"
            print("it could rain!")
        }
        wetWeatherLabel.text = willItRain

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

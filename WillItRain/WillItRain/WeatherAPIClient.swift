//
//  WeatherAPIClient.swift
//  WillItRain
//
//  Created by Geena Deierl on 16/5/2022.
//

//File To import Weather API into app.

import Foundation

struct WeatherManager{
    
    // Update the appid with your API Key
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=71355d37905db57b91585cd5f8ea1663&units=metric"
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // step1: create URL
        if let url = URL(string: urlString) {
            // step 2: create a URL session
            let session = URLSession(configuration: .default)
            // step 3: give URLSession a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString!)
                    self.parseJSON(weatherData: safeData)
                }
            }
            // step 4: start a task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.name)
            print(decodedData.main.temp)
            print(decodedData.weather[0].description)
            
            //storing the weather information
            let defaults = UserDefaults.standard
            
            defaults.set(decodedData.main.temp, forKey: "WEATHER_INFORMATION_TEMP")
            
            defaults.set(decodedData.main.feels_like, forKey: "WEATHER_INFORMATION_FEELSLIKE")
           
            defaults.set(decodedData.main.temp_min, forKey: "WEATHER_INFORMATION_TEMPMIN")
        
            defaults.set(decodedData.main.temp_max, forKey: "WEATHER_INFORMATION_TEMPMAX")
            
            defaults.set(decodedData.wind.speed, forKey: "WEATHER_INFORMATION_WINDSPEED")
            
            defaults.set(decodedData.weather[0].description, forKey: "WEATHER_INFORMATION_CONDITIONS")
            
            defaults.set(decodedData.weather[0].icon, forKey: "WEATHER_INFORMATION_ICON")
        } catch {
            print(error)
        }
    }
}

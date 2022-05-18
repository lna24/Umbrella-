//
//  WeatherModel.swift
//  WillItRain
//
//  Created by Geena Deierl on 16/5/2022.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    let wind: Wind
    //let pop: Double //probability of precipitation
}

struct Main: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
}

struct Wind: Decodable {
    let speed: Double
}

struct Weather: Decodable {
    let description: String
    let icon: String
}

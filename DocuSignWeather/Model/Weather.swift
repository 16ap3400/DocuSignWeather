//
//  Weather.swift
//  DocuSignWeather
//
//  Created by Alex Peterson on 3/29/21.
//

import Foundation

struct WeatherResponse: Decodable {
    var dt: Int?
    let main: Weather
    let weather: [Conditions]
}

struct Weather: Decodable {
    var temp: Double?
    var temp_min: Double?
    var temp_max: Double?
    var humidity: Double?
    
}

struct Conditions: Decodable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

// Forecast JSON: lists forecast for every 3 hours for the next five days
struct ForecastList: Decodable {
    var list: [WeatherResponse]
}

//
//  Weather.swift
//  DocuSignWeather
//
//  Created by Alex Peterson on 3/29/21.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
    var dt: Int?
}

struct Weather: Decodable {
    var temp: Double?
    var temp_min: Double?
    var temp_max: Double?
    var humidity: Double?
    
}

// Forecast JSON: lists forecast for every 3 hours for the next five days
struct ForecastList: Decodable {
    var list: [WeatherResponse]
}

//
//  WeatherService.swift
//  DocuSignWeather
//
//  Created by Alex Peterson on 3/29/21.
//

import Foundation
import SwiftUI

class WeatherService {
    
    func getWeather(city: String, completion: @escaping ([Any?]) -> ()) {
        
        let forecastBaseURL = "https://api.openweathermap.org/data/2.5/forecast?appid=67b46e25235af20a6152a33263f69817&units=imperial"
        
        let apiURL = "\(forecastBaseURL)&q=\(city)"
        
        guard let url = URL(string: apiURL) else {
            print("error in url")
            completion([nil])

            return
        }
        
        print(url)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async{
                    print("error in urlsession")
                    completion([nil])
                }
                return
            }
            
            let forecastList = try? JSONDecoder().decode(ForecastList.self, from: data)
            
            if let forecastList = forecastList {
                
                //8 apart because the list is every 3 hours. 8 = 1 day.
                let weatherResponse = forecastList.list[0]
                let weatherResponse2 = forecastList.list[9]
                let weatherResponse3 = forecastList.list[17]
                let weatherResponse4 = forecastList.list[25]
                let weatherResponse5 = forecastList.list[33]
                let weatherResponse6 = forecastList.list[39]
                
                let weather = weatherResponse.main
                let weather2 = weatherResponse2.main
                let weather3 = weatherResponse3.main
                let weather4 = weatherResponse4.main
                let weather5 = weatherResponse5.main
                let weather6 = weatherResponse6.main
                
                let date = weatherResponse.dt
                let date2 = weatherResponse2.dt
                let date3 = weatherResponse3.dt
                let date4 = weatherResponse4.dt
                let date5 = weatherResponse5.dt
                let date6 = weatherResponse6.dt
                
                //get icons
                let icon = weatherResponse.weather[0]
                let icon2 = weatherResponse2.weather[0]
                let icon3 = weatherResponse3.weather[0]
                let icon4 = weatherResponse4.weather[0]
                let icon5 = weatherResponse5.weather[0]
                let icon6 = weatherResponse6.weather[0]
                
                print("weatherResponse.weather[0] = \(weatherResponse.weather[0])")
                print("weatherResponse.weather[0].icon! = \(weatherResponse.weather[0].icon!)")
                
//                let weatherArray = [weather, weather2, weather3, weather4, weather5, weather6, date ?? 0, date2 ?? 0, date3 ?? 0, date4 ?? 0, date5 ?? 0, date6 ?? 0] as [Any]
                
                let weatherArray = [weather, weather2, weather3, weather4, weather5, weather6, date ?? 0, date2 ?? 0, date3 ?? 0, date4 ?? 0, date5 ?? 0, date6 ?? 0, icon, icon2, icon3, icon4, icon5, icon6] as [Any]
                
                print("First forecasted item is: \(weather)")
                
                completion(weatherArray)

            } else {
                DispatchQueue.main.async {
                    print("error in forecast list")
                    completion([nil])
                }
            }
        }.resume()
    }
}


class ImageLoader: ObservableObject {
    var data = Data()
    
    init(iconString: String) {
        guard let urlStr = URL(string:"http://openweathermap.org/img/w/\(iconString).png") else {return}
        let task = URLSession.shared.dataTask(with: urlStr) {data, response, error in
            guard let data = data else {return}
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
    
}

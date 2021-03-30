//
//  WeatherViewModel.swift
//  DocuSignWeather
//
//  Created by Alex Peterson on 3/30/21.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    @Published var weather = Weather()
    @Published var weather2 = Weather()
    @Published var weather3 = Weather()
    @Published var weather4 = Weather()
    @Published var weather5 = Weather()
    @Published var weather6 = Weather()
    
    @Published var date = 0
    @Published var date2 = 0
    @Published var date3 = 0
    @Published var date4 = 0
    @Published var date5 = 0
    @Published var date6 = 0
    
    
    
    func getDate(_ index: Int) -> String {
        let dateArray = [date, date2, date3, date4, date5, date6]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
//        dateFormatter.dateStyle = .medium
//        dateFormatter.timeStyle = .none
//        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(dateArray[index])))
    }
    
    var temperature: String {
        if let temp = self.weather.temp {
            return String(format: "%.0f", temp)
        } else {
            print("error")
            return ""
        }
    }
    
    var temperature2: String {
        if let temp = self.weather2.temp {
            return String(format: "%.0f", temp)
        } else {
            print("error")
            return ""
        }
    }
    
    var temperature3: String {
        if let temp = self.weather3.temp {
            return String(format: "%.0f", temp)
        } else {
            print("error")
            return ""
        }
    }
    
    var temperature4: String {
        if let temp = self.weather4.temp {
            return String(format: "%.0f", temp)
        } else {
            print("error")
            return ""
        }
    }
    
    var temperature5: String {
        if let temp = self.weather5.temp {
            return String(format: "%.0f", temp)
        } else {
            print("error")
            return ""
        }
    }
    
    func fetchWeather(city: String) {
        WeatherService().getWeather(city: city) { weatherArray in
            
            DispatchQueue.main.async {
                self.weather = weatherArray[0]! as! Weather
                self.weather2 = weatherArray[1]! as! Weather
                self.weather3 = weatherArray[2]! as! Weather
                self.weather4 = weatherArray[3]! as! Weather
                self.weather5 = weatherArray[4]! as! Weather
                self.weather6 = weatherArray[5]! as! Weather
                
                self.date = weatherArray[6]! as! Int
                self.date2 = weatherArray[7]! as! Int
                self.date3 = weatherArray[8]! as! Int
                self.date4 = weatherArray[9]! as! Int
                self.date5 = weatherArray[10]! as! Int
                self.date6 = weatherArray[11]! as! Int
            }
        }
    }
}

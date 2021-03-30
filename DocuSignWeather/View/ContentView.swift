//
//  ContentView.swift
//  DocuSignWeather
//
//  Created by Alex Peterson on 3/29/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherViewModel: WeatherViewModel
    
    var city: String
    
    init(city: String) {
        self.weatherViewModel = WeatherViewModel()
        self.city = city
        fetch()
    }
    
    func fetch() {
        weatherViewModel.fetchWeather(city: city)
    }
    
    var body: some View {
        VStack(alignment: .leading){
            VStack{
                Group{
                    Group{
                        HStack{
                            Text("Current Weather")
                            Text("\(String(format: "%0.1f", weatherViewModel.weather.temp ?? 0.0))°F")
                        }
                    }
                    
                    Group{
                        HStack{
                            Text("Date")
                                .font(.system(size: 30))
                            Spacer()
                            Text("Forecast")
                                .font(.system(size: 30))
                        }
                        Divider()
                    }
                    Group{
                        HStack {
                            Text("Date: \(weatherViewModel.getDate(1))")
                                .font(.system(size: 20))
                            Spacer()
                            VStack(alignment: .leading) {
                                
                                Text("Low: " + String(format: "%.1f", weatherViewModel.weather2.temp_min ?? 0.0) + " °F")
                                    .font(.system(size: 20))
                                Text("High: " + String(format: "%.1f", weatherViewModel.weather2.temp_max ?? 0.0) + " °F")
                                    .font(.system(size: 20))
                            }
                        }
                        Divider()
                        HStack {
                            Text("Date: \(weatherViewModel.getDate(2))")
                                .font(.system(size: 20))
                            Spacer()
                            VStack(alignment: .leading) {
                                
                                Text("Low: " + String(format: "%.1f", weatherViewModel.weather3.temp_min ?? 0.0) + " °F")
                                    .font(.system(size: 20))
                                Text("High: " + String(format: "%.1f", weatherViewModel.weather3.temp_max ?? 0.0) + " °F")
                                    .font(.system(size: 20))
                            }
                        }
                        Divider()
                        HStack {
                            Text("Date: \(weatherViewModel.getDate(3))")
                                .font(.system(size: 20))
                            Spacer()
                            VStack(alignment: .leading) {
                                
                                Text("Low: " + String(format: "%.1f", weatherViewModel.weather4.temp_min ?? 0.0) + " °F")
                                    .font(.system(size: 20))
                                Text("High: " + String(format: "%.1f", weatherViewModel.weather4.temp_max ?? 0.0) + " °F")
                                    .font(.system(size: 20))
                            }
                        }
                        Divider()
                        HStack {
                            Text("Date: \(weatherViewModel.getDate(4))")
                                .font(.system(size: 20))
                            Spacer()
                            VStack(alignment: .leading) {
                                
                                Text("Low: " + String(format: "%.1f", weatherViewModel.weather5.temp_min ?? 0.0) + " °F")
                                    .font(.system(size: 20))
                                Text("High: " + String(format: "%.1f", weatherViewModel.weather5.temp_max ?? 0.0) + " °F")
                                    .font(.system(size: 20))
                            }
                        }
                        Divider()
                        HStack {
                            Text("Date: \(weatherViewModel.getDate(5))")
                                .font(.system(size: 20))
                            Spacer()
                            VStack(alignment: .leading) {
                                
                                Text("Low: " + String(format: "%.1f", weatherViewModel.weather6.temp_min ?? 0.0) + " °F")
                                    .font(.system(size: 20))
                                Text("High: " + String(format: "%.1f", weatherViewModel.weather6.temp_max ?? 0.0) + " °F")
                                    .font(.system(size: 20))
                            }
                        }
                    }
                    
                }
                
                
                
            }
            .padding(.horizontal)
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(city: "provo")
    }
}

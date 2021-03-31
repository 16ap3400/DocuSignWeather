//
//  ContentView.swift
//  DocuSignWeather
//
//  Created by Alex Peterson on 3/29/21.
//

import SwiftUI

struct ContentView: View {
    
    //viewmodel and textfield
    @State var city: String = ""
    @State var cityText: String = "Provo"
    @ObservedObject var weatherViewModel: WeatherViewModel

    init() {
        self.weatherViewModel = WeatherViewModel()
    }
    
    
    
    func fetch() {
        weatherViewModel.fetchWeather(city: city)
        cityText = city
        city = ""
    }
    
    func makeImageURL(_ iconURL: String) -> String {
        print("icon URL: \(iconURL)")
        return "http://openweathermap.org/img/w/\(iconURL).png"
    }
        
    
    var body: some View {
        VStack(alignment: .leading){
            VStack{
                VStack(alignment: .center) {
                    Text("\(cityText)")
                        .font(.system(size:40, weight: .bold))
                    Text("\(weatherViewModel.icon.description ?? "cloudy")")
                        .font(.system(.title3))
                    Text("\(String(format: "%0.0f", weatherViewModel.weather.temp ?? 0.0))°")
                        .font(.system(size:40, weight: .light))
                    RemoteImage(url: makeImageURL(weatherViewModel.icon.icon ?? "02d"))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                }
                .padding(.bottom, 40)
                HStack{
                    TextField("Search a city...", text: $city)
                        .frame(width: UIScreen.main.bounds.width * 0.8)
                    Button(action: {
                        print("Button was tapped")
                        fetch()
                    }) {
                        Image(systemName: "magnifyingglass")
                            .renderingMode(.original)
                    }
                }.padding(.bottom, 40)
            }
                HStack{
                    Text("Date")
                        .font(.system(size: 30))
                    Spacer()
                    Text("Forecast")
                        .font(.system(size: 30))
                }
                Divider()
                listView(weatherViewModel: weatherViewModel)
}
            .padding(.horizontal)

        }
    }

struct listItem: View {
    
    var index: Int
    var weatherInfo: Weather
    var conditions: Conditions
    @ObservedObject var weatherViewModel: WeatherViewModel
    
    func makeImageURL(_ iconURL: String) -> String {
        print("icon URL: \(iconURL)")
        return "http://openweathermap.org/img/w/\(iconURL).png"
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text("\(weatherViewModel.getDate(index))")
                    .font(.system(size: 14))
                Text("\(conditions.description ?? "")")
            }
            Spacer()
            VStack(alignment: .leading) {
                
                Text("L: " + String(format: "%.0f", weatherInfo.temp_min ?? 0.0) + "°")
                    .font(.system(size: 20))
                Text("H: " + String(format: "%.0f", weatherInfo.temp_max ?? 0.0) + "°")
                    .font(.system(size: 20))
            }
            RemoteImage(url: makeImageURL(conditions.icon ?? "02d"))
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
        }
        Divider()
    }
}

struct listView: View {
    
    @ObservedObject var weatherViewModel: WeatherViewModel
    
    var body: some View{
        Group{
            listItem(index: 1, weatherInfo: weatherViewModel.weather, conditions: weatherViewModel.icon, weatherViewModel: weatherViewModel )
            listItem(index: 2, weatherInfo: weatherViewModel.weather2, conditions: weatherViewModel.icon2, weatherViewModel: weatherViewModel)
            listItem(index: 3, weatherInfo: weatherViewModel.weather3, conditions: weatherViewModel.icon3, weatherViewModel: weatherViewModel )
            listItem(index: 4, weatherInfo: weatherViewModel.weather4, conditions: weatherViewModel.icon4, weatherViewModel: weatherViewModel)
            listItem(index: 5, weatherInfo: weatherViewModel.weather5, conditions: weatherViewModel.icon5, weatherViewModel: weatherViewModel )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}

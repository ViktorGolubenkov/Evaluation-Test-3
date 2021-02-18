//
//  OpenWeatherManager.swift
//  Test
//
//  Created by Viktor Golubenkov on 16.02.2021.
//

import Foundation
import CoreLocation

protocol OpenWeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: OpenWeatherManager, weather: OpenWeatherModel)
    func didFailWithError(error: Error)
}

struct OpenWeatherManager {
    
    // INSERT YOUR KEY HERE:
    let weatherURL = "https://api.openweathermap.org/data/2.5/forecast?appid=INSERT YOUR KEY HERE&units=metric"
    
    var delegate: OpenWeatherManagerDelegate?
    
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(urlString)
    }
    
    func performRequest(_ urlString: String) {

        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> OpenWeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Empty.self, from: weatherData)

//
//            let id = decodedData.city.id
//            print(id)
//            let name = decodedData.city.name
//            print(name)
//            let country = decodedData.city.country
//            print(country)
            let temperature1 = decodedData.list[0].main.temp
//            print(temperature1)
            let date1 = decodedData.list[0].dtTxt
//            print(date1)
            let conditionID1 = decodedData.list[0].weather[0].id
//            print(conditionID1)
            let temperature2 = decodedData.list[8].main.temp
            let date2 = decodedData.list[8].dtTxt
            let conditionID2 = decodedData.list[8].weather[0].id
            let temperature3 = decodedData.list[16].main.temp
            let date3 = decodedData.list[16].dtTxt
            let conditionID3 = decodedData.list[16].weather[0].id
            let temperature4 = decodedData.list[24].main.temp
            let date4 = decodedData.list[24].dtTxt
            let conditionID4 = decodedData.list[24].weather[0].id
            let temperature5 = decodedData.list[32].main.temp
            let date5 = decodedData.list[32].dtTxt
            let conditionID5 = decodedData.list[32].weather[0].id
            
            
            let weather = OpenWeatherModel(conditionId1: conditionID1, temperature1: temperature1, dtTxt1: date1, conditionId2: conditionID2, temperature2: temperature2, dtTxt2: date2, conditionId3: conditionID3, temperature3: temperature3, dtTxt3: date3, conditionId4: conditionID4, temperature4: temperature4, dtTxt4: date4, conditionId5: conditionID5, temperature5: temperature5, dtTxt5: date5)
            
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
}

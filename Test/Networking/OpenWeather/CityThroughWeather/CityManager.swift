//
//  CityManager.swift
//  Test
//
//  Created by Viktor Golubenkov on 17.02.2021.
//

import Foundation
import CoreLocation

protocol CityManagerDelegate {
    func didUpdateCity(_ cityManager: CityManager, city: CityModel)
    func didFailWithError(error: Error)
}

struct CityManager {
    
    // INSERT YOUR KEY HERE:
    let urlForCity = "https://api.openweathermap.org/data/2.5/weather?appid=INSERT YOUR KEY HERE"

    var cityDelegate: CityManagerDelegate?
    
    
    func fetchCityThroughWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(urlForCity)&lat=\(latitude)&lon=\(longitude)"
        performRequestForCity(urlString)
    }

    
    func performRequestForCity(_ urlForCity: String) {

        if let url = URL(string: urlForCity) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.cityDelegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let cityName = self.parseJSONForCity(safeData) {
                        self.cityDelegate?.didUpdateCity(self, city: cityName)
                    }
                }
            }
            task.resume()
        }
    }
    
    
    func parseJSONForCity(_ data: Data) -> CityModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CityData.self, from: data)
            
            let name = decodedData.name
            let cityName = CityModel(cityName: name)
            
            return cityName
            
        } catch {
            cityDelegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}


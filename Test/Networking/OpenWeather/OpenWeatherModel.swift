//
//  OpenWeatherModel.swift
//  Test
//
//  Created by Viktor Golubenkov on 17.02.2021.
//

import Foundation

struct OpenWeatherModel {
    
    let conditionId1: Int
    let temperature1: Double
    let dtTxt1: String
    let conditionId2: Int
    let temperature2: Double
    let dtTxt2: String
    let conditionId3: Int
    let temperature3: Double
    let dtTxt3: String
    let conditionId4: Int
    let temperature4: Double
    let dtTxt4: String
    let conditionId5: Int
    let temperature5: Double
    let dtTxt5: String

    var temperatureString1: String {
        return String(format: "%.1f", temperature1)
    }
      
    var conditionName1: String {
        switch conditionId1 {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "cloud"
        }
        
    }
    
    var temperatureString2: String {
        return String(format: "%.1f", temperature2)
    }
    
    var conditionName2: String {
        switch conditionId2 {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "cloud"
        }
        
    }
    
    var temperatureString3: String {
        return String(format: "%.1f", temperature3)
    }
    
    var conditionName3: String {
        switch conditionId3 {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "cloud"
        }
        
    }
    
    var temperatureString4: String {
        return String(format: "%.1f", temperature4)
    }
    
    var conditionName4: String {
        switch conditionId4 {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "cloud"
        }
        
    }
    
    var temperatureString5: String {
        return String(format: "%.1f", temperature5)
    }
    
    var conditionName5: String {
        switch conditionId5 {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "cloud"
        }
        
    }
}

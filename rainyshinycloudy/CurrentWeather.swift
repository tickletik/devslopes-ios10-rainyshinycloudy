//
//  CurrentWeather.swift
//  rainyshinycloudy
//
//  Created by ronny abraham on 8/11/17.
//  Copyright © 2017 ronny abraham. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        
        return _cityName
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        // Alamofire download
        print("in downlaodWeatherDetails")
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        
        Alamofire.request(currentWeatherURL).responseJSON { response in
        
            let result = response.result
            
            print("in downloadWeatherDetails/DownloadComplete")
        
            // create dictionary by casting everything in result.value to be a dictionary with the name "dict" and do something with it
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print("loaded _cityName: \(self._cityName!)")
                }
                
                /* weather is an array of items, go to the first - zeroth
                    item in the array and pull out the "main" value
                */
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print("loaded _weatherType: \(self._weatherType!)")
                    }
                }
                
                if let main = dict["main"] {
                    if let currentTemperature = main["temp"] as? Double{
                        // temperature is done in kelvin, convert to faren
                        self._currentTemp = self._kelvinToFarenheit(kelvinTemp: currentTemperature)
                        print("loaded _currentTemp: \(self._currentTemp!)")
                        
                    }
                }
            } // end if let dict=result
            
            completed()
        } // end alamofire.request
        
    }
    
    func _kelvinToFarenheit(kelvinTemp: Double) -> Double {
        let kelvinPreDivision = kelvinTemp * (9/5) - 459.67
        return Double(round(10 * kelvinPreDivision/10))
    }
    
}

//
//  Constants.swift
//  rainyshinycloudy
//
//  Created by ronny abraham on 8/11/17.
//  Copyright © 2017 ronny abraham. All rights reserved.
//

import Foundation

typealias DownloadComplete = () -> ()

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"

let LATITUDE = "lat="
let LONGITUDE = "&lon="

let APP_ID = "&APPID="
let API_KEY = "3f3a2a88f3e6c0a416e8036819de0bfa"

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(APP_ID)\(API_KEY)"

let BASE_FORECAST = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let FORECAST_URL = "\(BASE_FORECAST)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)&mode=json\(APP_ID)\(API_KEY)"

// lat=35&lon=139&APPID=

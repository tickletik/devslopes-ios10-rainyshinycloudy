//
//  Location.swift
//  rainyshinycloudy
//
//  Created by ronny abraham on 8/24/17.
//  Copyright © 2017 ronny abraham. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}

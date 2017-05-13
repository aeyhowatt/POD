//
//  Location.swift
//  POD
//
//  Created by Aey Howatt on 4/25/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import UIKit

class Location{
    var locationID: Int
    var locationName: String
    var locationAddress: String
    var latitude: Double
    var longitude: Double
    var zipCode: Int
    init(locationID:Int,locationName:String,locationAddress:String,latitude:Double,longitude:Double,zipCode:Int){
        self.locationID = locationID
        self.locationName = locationName
        self.locationAddress = locationAddress
        self.latitude = latitude
        self.longitude = longitude
        self.zipCode = zipCode
    }
}

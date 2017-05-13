//
//  Vehicle.swift
//  POD
//
//  Created by Aey Howatt on 4/25/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import UIKit

class Vehicle{
    var vehicleID: Int
    var vehicleType: String
    var plateNumber: String
    
    init(vehicleID:Int,vehicleType:String,plateNumber:String){
        self.vehicleID = vehicleID
        self.vehicleType = vehicleType
        self.plateNumber = plateNumber
    }
}


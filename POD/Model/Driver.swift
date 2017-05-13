//
//  Driver.swift
//  POD
//
//  Created by Aey Howatt on 4/25/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import UIKit

class Driver{
    var driverID: Int
    var employeeID: Int
    var phoneNumber: String
    
    init(driverID:Int,employeeID:Int,phoneNumber:String){
        self.driverID = driverID
        self.employeeID = employeeID
        self.phoneNumber = phoneNumber
    }
}

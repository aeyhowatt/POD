//
//  Customer.swift
//  POD
//
//  Created by Aey Howatt on 4/25/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import UIKit

class Customer{
    var customerID: Int
    var firstName: String
    var lastName: String
    var locationID: Int
    var email: String
    var phoneNumber: String
    
    init(customerID:Int,firstName:String,lastName:String, locationID:Int, email:String, phoneNumber:String){
        self.customerID = customerID
        self.firstName = firstName
        self.lastName = lastName
        self.locationID = locationID
        self.email = email
        self.phoneNumber = phoneNumber
    }
}

//
//  Employee.swift
//  POD
//
//  Created by Aey Howatt on 4/25/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import UIKit

class Employee{
    var employeeID: Int
    var firstName: String
    var lastName: String
    var phoneNumber: String
    
    init(employeeID:Int,firstName:String,lastName:String,phoneNumber:String){
        self.employeeID = employeeID
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
    }
}

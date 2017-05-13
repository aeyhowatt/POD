//
//  Admin.swift
//  POD
//
//  Created by Aey Howatt on 4/25/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import UIKit

class Admin{
    var adminID: Int
    var employeeID: Int
    var password: String

    init(adminID:Int,employeeID:Int,password:String){
        self.adminID = adminID
        self.employeeID = employeeID
        self.password = password
    }
    
}

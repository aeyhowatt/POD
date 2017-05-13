//
//  Order.swift
//  POD
//
//  Created by Aey Howatt on 4/25/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import UIKit
import ObjectMapper

class Order:Mappable {
    var orderID: Int = -1
    var dateTime: Date = Date()
    var productSKU: String = "Unknown SKU"
    //var customer:Customer?  //from Mappable
    var customerID: Int = -1
    var firstName: String = ""
    var lastName: String = ""
    var locationID: Int = -1
    var email: String = ""
    var phoneNum: String = ""
    
    
    var statusID: Int = -1
    var warehouseStaffID: Int = -1
    var driverID: Int = -1
    var vehicleID: Int = -1
    var dcStaffID: Int = -1
    var insuranceID: Int = -1
    
    init?() {
        // Empty Constructor
    }
    
    required init?(map: Map) {
        //        mapping(map: map)
    }
    
    
    init(orderID:Int,date:Date?=nil,dateTime:String?=nil,productSKU:String,customerID:Int,statusID:Int,firstName:String,lastName:String,locationID:Int,email:String,phoneNum:String,warehouseStaffID:Int,driverID:Int,vehicleID:Int,dcStaffID:Int,insuranceID:Int){
        self.orderID = orderID
        if let date = date{
            self.dateTime = date
        }else if let dateTime = dateTime{
            self.dateTime = Date()
        }else{
            self.dateTime = Date()
        }
        self.productSKU = productSKU
        self.customerID = customerID
        self.firstName = firstName
        self.lastName = lastName
        self.locationID = locationID
        self.email = email
        self.phoneNum = phoneNum
    
        self.statusID = statusID
        self.warehouseStaffID = warehouseStaffID
        self.driverID = driverID
        self.vehicleID = vehicleID
        self.dcStaffID = dcStaffID
        self.insuranceID = insuranceID
    }
    
    /* Methods */
    
    func mapping(map: Map) {
        var orderIDStr:String = ""
        var customerIDStr:String = ""
        orderIDStr <- map["order_id"]
        customerIDStr <- map["customer_id"]
        orderID = Int(orderIDStr)!
        dateTime <- map["date_time"] //parse here from string into Date
        productSKU <- map["product_sku"]
        customerID = Int(customerIDStr)!
    }
}

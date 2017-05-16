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
//    var orderID: Int = -1
    var orderID: Int = -1
    //var dateTime: Date = Date()
    var dateTime: String = ""
    var productSKU: String = "Unknown SKU"
    //var customer:Customer?  //from Mappable
//    var customerID: Int = -1
    var customerID: Int = -1
    var firstName: String = ""
    var lastName: String = ""
    var locationID: Int = -1
    var email: String = ""
    var phoneNum: String = ""
    
    var productName: String = ""
    var quantity: Int = -1
    
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
    
    
    //date:Date?=nil
    
    init(orderID:Int,dateTime:String,productSKU:String,customerID:Int,statusID:Int,firstName:String,lastName:String,locationID:Int,email:String,phoneNum:String,productName:String,quantity:Int,warehouseStaffID:Int,driverID:Int,vehicleID:Int,dcStaffID:Int,insuranceID:Int){
        self.orderID = orderID
//        if let date = date{
//            self.dateTime = date
//        }else if let dateTime = dateTime{
//            self.dateTime = Date()
//        }else{
//            self.dateTime = Date()
//        }
        
        self.dateTime = dateTime
        self.productSKU = productSKU
        self.customerID = customerID
        self.firstName = firstName
        self.lastName = lastName
        self.locationID = locationID
        self.email = email
        self.phoneNum = phoneNum
        
        self.productName = productName
        self.quantity = quantity
        
        self.statusID = statusID
        
        self.warehouseStaffID = warehouseStaffID
        self.driverID = driverID
        self.vehicleID = vehicleID
        self.dcStaffID = dcStaffID
        self.insuranceID = insuranceID
    }
    
    /* Methods */
    
    func mapping(map: Map) {

        orderID <- map["order_id"]
        dateTime <- map["date_time"] //parse here from string into Date
        productSKU <- map["product_sku"]
        customerID <- map["customer_id"]
        
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        locationID <- map["location_id"]
        email <- map["email"]
        phoneNum <- map["phone_number"]
        statusID <- map["status_id"]
        
        productName <- map["name"]
        quantity <- map["quantity"]

    }
}

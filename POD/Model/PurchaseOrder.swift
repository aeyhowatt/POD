//
//  PurchaseOrder.swift
//  POD
//
//  Created by Aey Howatt on 4/25/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import UIKit

class PurchaseOrder{
    var orderID: Int
    var customerID: Int
    var discount: Int
    
    init(orderID:Int,customerID:Int,discount:Int){
        self.orderID = orderID
        self.customerID = customerID
        self.discount = discount
    }
}

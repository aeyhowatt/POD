//
//  MergedOrder.swift
//  POD
//
//  Created by Aey Howatt on 5/13/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import UIKit

class MergedOrder {
    
    var orderID: Int
    var orderList: [Order] = []
    
    init(orderID:Int,orderList: [Order] = []){
        self.orderID = orderID
        self.orderList = orderList
    }
    
}

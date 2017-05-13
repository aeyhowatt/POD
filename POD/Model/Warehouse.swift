//
//  Warehouse.swift
//  POD
//
//  Created by Aey Howatt on 4/25/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import UIKit

class Warehouse{
    var warehouseID: Int
    var warehouseName: String
    var locationID: Int
    
    init(warehouseID:Int,warehouseName:String,locationID:Int) {
        self.warehouseID = warehouseID
        self.warehouseName = warehouseName
        self.locationID = locationID
    }
}

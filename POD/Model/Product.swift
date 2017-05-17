//
//  Product.swift
//  POD
//
//  Created by Aey Howatt on 4/25/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import UIKit
import ObjectMapper

class Product:Mappable{
    var productSKU: String = ""
    var name: String = ""
    var definition: String = ""
    var category: String = ""
    var price: Double = -1
    
    init?() {
        // Empty Constructor
    }
    
    required init?(map: Map) {
        //        mapping(map: map)
    }
    
    init(productSKU:String,name:String,definition:String,category:String,price:Double){
        self.productSKU = productSKU
        self.name = name
        self.definition = definition
        self.category = category
        self.price = price
    }
    
    /* Methods */
    
    func mapping(map: Map) {
        productSKU <- map["product_sku"]
        name <- map["name"]
        definition <- map["definition"]
        category <- map["category"]
        price <- map["price"]
    }
    
    
}

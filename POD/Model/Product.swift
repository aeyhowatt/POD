//
//  Product.swift
//  POD
//
//  Created by Aey Howatt on 4/25/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import UIKit

class Product{
    var productSKU: String
    var name: String
    var definition: String
    var category: String
    var price: Double
    
    init(productSKU:String,name:String,definition:String,category:String,price:Double){
        self.productSKU = productSKU
        self.name = name
        self.definition = definition
        self.category = category
        self.price = price
    }
}

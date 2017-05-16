//
//  Result.swift
//  POD
//
//  Created by Aey Howatt on 5/14/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import UIKit
import ObjectMapper

class Result:Mappable{
    
    var result: String = ""
    
    init?() {
        // Empty Constructor
    }
    
    required init?(map: Map) {
        //        mapping(map: map)
    }
    
    init(result:String){
        self.result = result
    }
    
    /* Methods */
    
    func mapping(map: Map) {
        result <- map["result"]
    }
}

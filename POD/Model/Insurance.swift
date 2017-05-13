//
//  Insurance.swift
//  POD
//
//  Created by Aey Howatt on 4/25/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import UIKit

class Insurance{
    var insuranceID: Int
    var insuranceName: String
    var percentCoverage: Int
    
    init(insuranceID:Int,insuranceName:String,percentCoverage:Int){
        self.insuranceID = insuranceID
        self.insuranceName = insuranceName
        self.percentCoverage = percentCoverage
    }
}

//
//  OrderTableViewCell.swift
//  POD
//
//  Created by Aey Howatt on 4/25/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subLabel1: UILabel!
    @IBOutlet weak var subLabel2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        self.selectionStyle = .none //no cell highlight color
        super.setSelected(selected, animated: animated)
//        self.setupUI(withOrder: <#T##Order#>)
        // Configure the view for the selected state
    }

    func setupUI(withOrder mergedOrder:MergedOrder){
        titleLabel.text = "OD"+String(format: "%06d",(mergedOrder.orderID))
        //titleLabel.text = String((mergedOrder.orderID))
        
        var date: String = mergedOrder.orderList[0].dateTime
        let endIndex = date.index(date.endIndex, offsetBy: -7)
        var dateShort = date.substring(to: endIndex)
        //print(name)      // "Dolphin"
        //print(truncated) // "Dolph"
        
        subLabel1.text = String(dateShort)
        subLabel2.text = "CS"+String(format: "%06d",(mergedOrder.orderList[0].customerID))
        
    }
}


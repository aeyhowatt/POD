//
//  ItemTableViewCell.swift
//  POD
//
//  Created by Aey Howatt on 5/13/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI(withOrder order:Order){
        subLabel.text = String(order.productSKU)
        titleLabel.text = order.productName
        
//        subLabel1.text = String(describing: mergedOrder.orderList[0].dateTime)
//        subLabel2.text = String(mergedOrder.orderList[0].customerID)
    }
    
}

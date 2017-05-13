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
        super.setSelected(selected, animated: animated)
//        self.setupUI(withOrder: <#T##Order#>)
        // Configure the view for the selected state
    }

    func setupUI(withOrder order:Order){
        titleLabel.text = order.productSKU
        subLabel1.text = String(describing: order.dateTime)
        subLabel2.text = String(order.customerID)
    }
}


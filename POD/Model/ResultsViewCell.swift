//
//  ResultsViewCell.swift
//  POD
//
//  Created by Aey Howatt on 5/16/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import UIKit

class ResultsViewCell: UITableViewCell {

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
    
    func setupProductUI(withObject object:Product){
        subLabel.text = String(object.productSKU)
        titleLabel.text = object.name
    }
    
    func setupCustomerUI(withObject object:Customer){
        //        subLabel.text = String(order.productSKU)
        //        titleLabel.text = order.productName
    }

    
}

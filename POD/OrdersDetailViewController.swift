//
//  OrdersDetailViewController.swift
//  POD
//
//  Created by Aey Howatt on 5/10/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import UIKit

class OrdersDetailViewController: UIViewController {

    var order: Order?
    
    
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var customerBtn: UIButton!
    @IBOutlet weak var productBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let order = order{ //let does not allow order to be optional
            setupUI(withOrder: order)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickCancelBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func onClickDeclineBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func onClickAcceptBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    
    func setupUI(withOrder order:Order){
        orderLabel.text = order.productSKU
        dateLabel.text = String(describing: order.dateTime)
        customerBtn.setTitle(String(order.customerID), for: .normal)
        productBtn.setTitle(String(order.orderID), for: .normal)
    }
    
    
    // MARK: - Navigation



}

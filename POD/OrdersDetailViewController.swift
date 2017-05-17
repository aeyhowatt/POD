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
    var mergedOrder: MergedOrder?
    var currentTableData:[Order] = []
    
    //NETWORK
    let network:Network = Network()
    
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var customerLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let order = order{ //let does not allow order to be optional
//            
//            setupUI(withOrder: order)
//        }
        
        order = mergedOrder?.orderList[0]
        currentTableData = (mergedOrder?.orderList)!
        setupUI(withOrder: order!)
        
        //TABLEVIEW
            
        tableView.delegate = self
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemTableViewCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickCancelBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func onClickDeclineBtn(_ sender: Any) {
        updateOrderStatus(newStatus: 9, orderToUpdate: (order?.orderID)!)
        
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func onClickAcceptBtn(_ sender: Any) {
        updateOrderStatus(newStatus: (order?.statusID)!+1, orderToUpdate: (order?.orderID)!)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func setupUI(withOrder order:Order){
        orderLabel.text = String(order.orderID)
        
        var date: String = order.dateTime
        let endIndex = date.index(date.endIndex, offsetBy: -7)
        var dateShort = date.substring(to: endIndex)
        
        dateLabel.text = dateShort
        customerLabel.text = order.firstName+" "+order.lastName
        emailLabel.text = order.email
        phoneNumLabel.text = order.phoneNum
        
//        customerLabel.setTitle(order.firstName+" "+order.lastName, for: .normal)
        //productBtn.setTitle(String(order.productSKU), for: .normal)
    }
    
    
    // MARK: - Navigation

    // MARK: - Network
    
    func updateOrderStatus(newStatus: Int, orderToUpdate: Int){
        //newStatus = self.order?.statusID+1
        network.updateOrderArray(status: newStatus, orderID: orderToUpdate,
            onComplete: { orderArray in
                guard let orderArray = orderArray else{
                    return
                }
                //self.setTableData(orders: orderArray)
                print(newStatus)
                print(orderToUpdate)
            }
            ,onFailure: {
                print("fail")
            }
        )
    }

}

extension OrdersDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        //row height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentTableData.count
        //return 4
        //number of rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row;
        let simpleTableIdentifier = "ItemTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier) as! ItemTableViewCell
        //        let cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier, for: indexPath) as! OrderTableViewCell
        var order = currentTableData[row]
        cell.setupUI(withOrder: order)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let row = indexPath.row;
        //var order = currentTableData[row]
        //toOrdersDetailViewController(order:order) //calling function in navigation
    }
    
    
}


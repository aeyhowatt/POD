//
//  OrdersViewController.swift
//  POD
//
//  Created by Aey Howatt on 4/5/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import UIKit

class OrdersViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!

    var currentTableData:[Order] = []
    
    //NETWORK
    let network:Network = Network()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        tableView.delegate = self
//        tableView.dataSource = self
        tableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")

//        currentTableData.append(Order(orderID: 000001, date: Date(), productSKU: "CF0884720", customerID: 100001, statusID: 1, warehouseStaffID: 1, driverID: 1, vehicleID: 1, dcStaffID: 1, insuranceID: 1))
//        currentTableData.append(Order(orderID: 000002, date: Date(), productSKU: "CK0837410", customerID: 100002, statusID: 1, warehouseStaffID: 1, driverID: 1, vehicleID: 1, dcStaffID: 1, insuranceID: 1))
//        currentTableData.append(Order(orderID: 000003, date: Date(), productSKU: "CK7311265", customerID: 100003, statusID: 1, warehouseStaffID: 1, driverID: 1, vehicleID: 1, dcStaffID: 1, insuranceID: 1))
        
        //FETCH ORDER
        fetchOrder()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        if identifier == "" {
            //identifier of viewcontroller
            //parse data performsegue
        }
    }
    
    //MARK:- Table
    func setTableData(orders:[Order]){
        self.currentTableData = orders
        self.tableView.reloadData()
    }
    
    //MARK:- Network
    
    func fetchOrder(){
        network.fetchOrderArray(status: 2
            ,onComplete: { orderArray in
                guard let orderArray = orderArray else{
                    return
                }
                self.setTableData(orders: orderArray)
                
            }
            ,onFailure: {
                print("fail")
        })
    }
    
    //MARK:- Navigation
    
    func toOrdersDetailViewController(order:Order){
        let VC2 = self.storyboard?.instantiateViewController(withIdentifier: "OrdersDetailViewController") as! OrdersDetailViewController
        VC2.order = order
        self.present(VC2, animated: true, completion: {() -> Void in
        })
    }

}
extension OrdersViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
        //row height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentTableData.count
        //number of rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row;
        let simpleTableIdentifier = "OrderTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier) as! OrderTableViewCell
//        let cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier, for: indexPath) as! OrderTableViewCell
        var order = currentTableData[row]
        cell.setupUI(withOrder: order)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row;
        var order = currentTableData[row]
        toOrdersDetailViewController(order:order) //calling function in navigation
    }
    
    
}

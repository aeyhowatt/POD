//
//  DeliveryPendingViewController.swift
//  POD
//
//  Created by Aey Howatt on 4/30/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import UIKit

class DeliveryPendingViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var currentTableData:[Order] = []

    //NETWORK
    let network:Network = Network()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        //tableView.dataSource = self
        tableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")
        
//        currentTableData.append(Order(orderID: 000001, dateTime: "2017-04-19 08:13:45", productSKU: "CK5540387", customerID: 100014, statusID: 1, warehouseStaffID: 1, driverID: 1, vehicleID: 1, dcStaffID: 1, insuranceID: 1))
//        currentTableData.append(Order(orderID: 000001, dateTime: "2017-05-01 07:55:15", productSKU: "CF0884720", customerID: 100015, statusID: 1, warehouseStaffID: 1, driverID: 1, vehicleID: 1, dcStaffID: 1, insuranceID: 1))

        fetchOrder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //VC Appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Pending VC will appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Pending VC will disappear")
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
        network.fetchOrderArray(status: 5
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

extension DeliveryPendingViewController: UITableViewDelegate, UITableViewDataSource{
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
        toOrdersDetailViewController(order: order) //calling function in navigation
    }
    
    
    
}

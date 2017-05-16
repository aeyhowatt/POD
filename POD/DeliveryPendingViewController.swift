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
    
    var mergedTableData:[MergedOrder] = []
    var mergedOrdersDict: [Int:[Order]] = [:]

    //NETWORK
    let network:Network = Network()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        //tableView.dataSource = self
        tableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")

        fetchOrder()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
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
    func setTableData(orders:[MergedOrder]){
        self.mergedTableData = orders
        self.tableView.reloadData()
    }
    
    //MARK:- Network
    
    func fetchOrder(){
        network.fetchOrderArray(status: 5
            ,onComplete: { orderArray in
                guard let orderArray = orderArray else{
                    return
                }
                //SET UNIQUE ORDERS
                self.setUniqueOrders(orders: orderArray)
                
                //SET TABLE DATA
                self.setTableData(orders: self.mergedTableData)
        }
            ,onFailure: {
                print("fail")
        })
    }
    
    //TODO:—
    
    func setUniqueOrders(orders:[Order]){
        //CLEAR DICTIONARY
        
        mergedOrdersDict.removeAll()
        mergedTableData.removeAll()
        
        //BUILD DICTIONARY
        
        for order in orders{
            let keyExists = mergedOrdersDict[(order.orderID)] != nil
            if(keyExists){
                var temp:[Order] = mergedOrdersDict[(order.orderID)]!
                temp.append(order)
                mergedOrdersDict[(order.orderID)] = temp
            }else{
                mergedOrdersDict[order.orderID] = [order]
            }
            //dump(mergedOrdersDict)
        }
        for (key,value) in mergedOrdersDict{
            mergedTableData.append(MergedOrder(orderID: key,orderList: value))
        }
    }
    
    
    //MARK:- Navigation
    
    func toOrdersDetailViewController(order:MergedOrder){
        let VC2 = self.storyboard?.instantiateViewController(withIdentifier: "OrdersDetailViewController") as! OrdersDetailViewController
        VC2.mergedOrder = order
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
        return mergedTableData.count
        //number of rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row;
        let simpleTableIdentifier = "OrderTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier) as! OrderTableViewCell
        var order = mergedTableData[row]
        cell.setupUI(withOrder: order)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row;
        var order = mergedTableData[row]
        toOrdersDetailViewController(order:order) //calling function in navigation
    }
    
    
    
}

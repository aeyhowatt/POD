//
//  Network.swift
//  POD
//
//  Created by Aey Howatt on 5/9/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class Network {
    init(){
        
    }
    let BASE_LINK:String = "http://54.169.48.150/public/request"
    
    func fetchOrderArray( status: Int=1,onComplete: @escaping (_ array: [Order]?) -> Void,onFailure: @escaping () -> Void){
        let SUB_LINK = "/order.php" // /customer/1
        
        let request = Alamofire.request(BASE_LINK+SUB_LINK, method: .get, parameters: ["status":status])
            .responseArray { (response: DataResponse<[Order]>) in
                //                print("Fetching at:\(response.request?.url?.absoluteString)")
                switch response.result {
                case .success:
                    var array:[Order]? = nil
                    if let JSON = response.result.value{
                        array = JSON
                    }
                    print("Complete")
                    onComplete(array)
                    break
                case .failure:
                    print("Fetching Failed at:\(response.request?.url?.absoluteString)")
                    onFailure()
                }
        }
//        requests.append(request)
    }
    func updateOrderArray( status: Int=1, orderID: Int=0,onComplete: @escaping (_ array: [Order]?) -> Void,onFailure: @escaping () -> Void){
        let SUB_LINK = "/update_status.php" // /customer/1
        
        let request = Alamofire.request(BASE_LINK+SUB_LINK, method: .put, parameters: ["order_id":orderID, "status_id":status])
            .responseArray { (response: DataResponse<[Order]>) in
                //                print("Fetching at:\(response.request?.url?.absoluteString)")
                switch response.result {
                case .success:
                    var array:[Order]? = nil
                    if let JSON = response.result.value{
                        array = JSON
                    }
                    print("Complete")
                    onComplete(array)
                    break
                case .failure:
                    print("Fetching Failed at:\(response.request?.url?.absoluteString)")
                    onFailure()
                }
        }
        //        requests.append(request)
    }
    
    
}

//Network().fetchVehicleArrayByNetw

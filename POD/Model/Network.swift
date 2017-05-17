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
        
        let request = Alamofire.request(BASE_LINK+SUB_LINK, method: .get, parameters: ["status_id":status])
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
    
    func updateOrderArray( status: Int=1, orderID: Int=0,onComplete: @escaping (_ result: Result?) -> Void,onFailure: @escaping () -> Void){
        let SUB_LINK = "/update_status.php" // /customer/1
        
        let request = Alamofire.request(BASE_LINK+SUB_LINK, method: .post, parameters: ["status_id":status,"order_id":orderID])
            .responseObject { (response: DataResponse<Result>) in
                //                print("Fetching at:\(response.request?.url?.absoluteString)")
                switch response.result {
                case .success:
                    var result:Result? = nil
                    if let JSON = response.result.value{
                        result = JSON
                    }
                    print("Complete")
                    onComplete(result)
                    break
                case .failure:
                    
                    print("Fetching Failed at:\(response.request?.url?.absoluteString)")
                    onFailure()
                }
        }
        //        requests.append(request)
    }
    
    func getSearchProducts( searchQuery: String="",onComplete: @escaping (_ array: [Product]?) -> Void,onFailure: @escaping () -> Void){
        let SUB_LINK = "/search_product_by_name.php" // /customer/1
        
        let request = Alamofire.request(BASE_LINK+SUB_LINK, method: .get, parameters: ["search_text":searchQuery])
            .responseArray { (response: DataResponse<[Product]>) in
                //print("Fetching at:\(response.request?.url?.absoluteString)")
                switch response.result {
                case .success:
                    var array:[Product]? = nil
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

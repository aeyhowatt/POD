//
//  AddOrderViewController.swift
//  POD
//
//  Created by Aey Howatt on 5/16/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import UIKit

protocol AddOrderViewControllerDelegate {
    func newProductUpdate(product:Product)
} 

class AddOrderViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickCancelBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onClickDoneBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func toOrdersDetailViewController(object:Product){
        let VC2 = self.storyboard?.instantiateViewController(withIdentifier: "SearchProductViewController") as! SearchProductViewController
        //VC2.product = object //VC2's variable name
        VC2.delegate = self
        self.present(VC2, animated: true, completion: {() -> Void in
        })
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddOrderViewController:AddOrderViewControllerDelegate{
    func newProductUpdate(product:Product){
        
    }
}

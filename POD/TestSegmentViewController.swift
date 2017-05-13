//
//  TestSegmentViewController.swift
//  POD
//
//  Created by Aey Howatt on 4/30/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import UIKit
import TwicketSegmentedControl

class TestSegmentViewController: UIViewController {

    @IBOutlet weak var segmentcon: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var segmentTwicket: TwicketSegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //TWICKET
        
        let titles = ["Pending", "In-Delivery", "Completed"]
        let frame = CGRect(x: 5, y: view.frame.height / 2 - 20, width: view.frame.width - 10, height: 40)
        
        let segmentTwicket = TwicketSegmentedControl(frame: frame)
        segmentTwicket.setSegmentItems(titles)
        segmentTwicket.delegate = self
        
        view.addSubview(segmentTwicket)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ChangeLabel(_ sender: Any) {
        if segmentcon.selectedSegmentIndex==0{
            label.text = "1"
        }
        if segmentcon.selectedSegmentIndex==1{
            label.text = "2"
        }
        if segmentcon.selectedSegmentIndex==2{
            label.text = "3"
        }
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

extension TestSegmentViewController: TwicketSegmentedControlDelegate {
    func didSelect(_ segmentIndex: Int) {
        print("Selected index: \(segmentIndex)")
    }
}

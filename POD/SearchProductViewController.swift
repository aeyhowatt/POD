//
//  SearchViewController.swift
//  POD
//
//  Created by Aey Howatt on 5/16/17.
//  Copyright © 2017 aeyhwt. All rights reserved.
//

import UIKit


class SearchProductViewController: UIViewController {

//    @IBOutlet weak var statusView: UIView!
//    @IBOutlet weak var searchIconImgView: UIImageView!
    //    @IBOutlet weak var searchTextField: UITextField!
    //    @IBOutlet weak var cancelButton: UIButton!
//    @IBOutlet weak var searchView: RoundedView!
//    @IBOutlet weak var actionBarView: UIView!
    //    @IBOutlet weak var tableView: UITableView!
//    
//    var tableData:[(Layer,SearchObject)] = []
//    
    //    var searchManager:SearchManager = SearchManager()
//    var searchDataManager:SearchDataManager = SearchDataManager(recentRowNum: 6)
//    var delegate: SearchPhase2ViewControllerDelegate?
    
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var delegate:AddOrderViewControllerDelegate?
    
    var tableData:[Product] = []
    
    var searchManager:Network = Network()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetupButton()
        initialSetupTableView()
        
    }
    
    // MARK: - Initialize
    func initialSetupTableView(){
        tableView.register(UINib(nibName: "ResultsViewCell", bundle: nil), forCellReuseIdentifier: "ResultsViewCell")
    }
    
    func initialSetupButton(){
        //        clearButton.addTarget(self, action: #selector(clearText(_:)), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        searchTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .allEditingEvents)
        //Become First Responder
        let clearButton = UIButton(type: .custom)
        clearButton.setImage(#imageLiteral(resourceName: "ic_clear"), for: .normal)
        clearButton.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(45), height: CGFloat(45))
        clearButton.addTarget(self, action: #selector(clearText(_:)), for: .touchUpInside)
        searchTextField.rightViewMode = .whileEditing
        //can be changed to UITextFieldViewModeNever,    UITextFieldViewModeWhileEditing,   UITextFieldViewModeUnlessEditing
        searchTextField.rightView = clearButton
        searchTextField.becomeFirstResponder()
    }
    
    //MARK: - Button Function
    
    var timer:Timer?
    var lastSearchTimestamp:TimeInterval = 0
    let MAX_INTERVAL = 0.4 //Seconds
    
    func textFieldDidChange(_ textField: UITextField) {
        print("Text Changed:\(textField.text)")
        let searchText = textField.text
        guard searchText != nil else{
            return
        }
        //Remove any timer for search to prevent overlapping result
        if let timer = self.timer{
            timer.invalidate()
        }
        if searchText!.isEmpty{
            //Recent Search from data
            //            //Hide clear Button
            searchTextField.rightViewMode = .never
            //            self.clearButton.isHidden = true
//            searchManager.mode = .recent
//            let layerNodeList = searchDataManager.loadRecentNodeList(systemId: searchManager.systemId)
//            searchManager.clearAll()
//            for layerNode in layerNodeList{
//                let layerId = layerNode.0
//                let node = layerNode.1
//                searchManager.addNode(layerId, node: node, searchString: "")
//            }
//            self.updateTableView(searchManager.trackAddedOrderLayerSearchObject)
        }else{
            //Search For Node in network
            //Show Clear Button
            //            self.clearButton.isHidden = false
            searchTextField.rightViewMode = .whileEditing
//            searchManager.mode = .search
            // When type wait for x seconds (Interval) if this method not trigger then search
            let currentTimestamp = NSDate().timeIntervalSince1970
            
            
            timer = Timer.scheduledTimer(timeInterval: MAX_INTERVAL, target: self, selector: #selector(self.searchTextTimer(timer:)), userInfo: searchText, repeats: false);
        }
        
    }
    
    @objc private func searchTextTimer(timer: Timer){
        let searchString = timer.userInfo as! String
        self.searchText(searchString)
    }
    
    private func searchText(_ searchText:String){
        searchManager.getSearchProducts(searchQuery:searchText
            , onComplete: { products in //[(Layer,SearchObject)]
                //Change table view
                //self.updateTableView(layerSearchObjectList)
                self.updateTableView(products: products!)
        }, onFailure: {}
        )
        
    }
    
    func clearText(_ sender: UIButton){
        searchTextField.text = ""
        //Text has change deal with the visualize
        self.textFieldDidChange(searchTextField)
    }
    
    //MARK: - TableView
    
    func updateTableView(products:[Product]){
        tableData = products
        self.tableView.reloadData()
    }
    
//    func setTableData(orders:[MergedOrder]){
//        self.mergedTableData = orders
//        self.tableView.reloadData()
//    }
//    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
  
    
    func dismissViewController(_ sender: UIButton?){
        self.delegate?.newProductUpdate(product: <#T##Product#>)
        
        self.view.endEditing(true)
        self.dismiss(animated: false, completion: nil)
    }
    

    @IBAction func onClickCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

//MARK: - UITableViewDelegate
extension SearchProductViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row;
        let simpleTableIdentifier = "ResultsViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier, for: indexPath) as! ResultsViewCell
//        let layerSearchObject:(Layer,SearchObject) = tableData[row]
//        let layer:Layer = layerSearchObject.0
//        let searchObject:SearchObject = layerSearchObject.1
//        
//        let theme = searchManager.system?.theme
        
//        switch searchObject.contentType{
//        case .node:
//            cell.setUIWithNode(searchObject.node!, layer: layer, searchObject.searchText, theme: theme!)
//            break
//        case .network:
//            break
//        default:
//            break
//            
//        }
        var object = tableData[row]
        cell.setupProductUI(withObject: object)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell number: \(indexPath.row)!")
        
        let row = indexPath.row
        var object = tableData[row]
        
        //TODO:- TO ORDER VC
        toOrdersDetailViewController(object:object) //calling function in navigation
        
        delegate?.newProductUpdate(product: Product)
        
        
//        let layerSearchObject:(Layer,SearchObject) = tableData[row]
        
        
//        let layer:Layer = layerSearchObject.0
//        let searchObject:SearchObject = layerSearchObject.1
//        if searchObject.contentType == .node{
//            searchDataManager.addRecentNode(withNode: searchObject.node!, layerId: layer.id, systemId: searchManager.systemId)
//        }
//        delegate?.passSearchObject!(systemId: searchManager.systemId, layerId: layer.id, searchObject: searchObject)
        self.dismissViewController(nil)
        
    }
    
}

//
//  ItemViewController.swift
//  Location
//
//  Created by Rakesh on 28/02/23.
//

import UIKit


protocol itemCountDelegate: AnyObject{
    func itemCount(count:Int)
}
class ItemViewController: UIViewController {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var settingBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
     @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var itemTableView: UITableView!
    
    weak var itemDelegate : itemCountDelegate?
    var btnTagItem = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTableView.dataSource = self
        itemTableView.delegate = self
        
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)

        itemTableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        
        debugPrint("comesHere")
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2){
            self.itemTableView.reloadData()
        }
                                       
       
    
        }
   
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       
       
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
      
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      
      
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
       
    }
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    

    @IBAction func settingBtnAction(_ sender: Any) {
        
    }
    
    @IBAction func plusBtnAction(_ sender: Any) {
       
        let vc = storyboard?.instantiateViewController(withIdentifier: "ItemDescriptionViewController")as! ItemDescriptionViewController
        btnTagItem += 1
        navigationController?.pushViewController(vc, animated: true)
       
    }
}
extension ItemViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.itemDelegate?.itemCount(count: btnTagItem)
        return btnTagItem
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath)as! CustomTableViewCell
        let index = " \(indexPath.row+1)"
        cell.titleLbl.text = nameLbl.text?.appending(index)
        cell.colorView.isHidden = true
        
        cell.imgView.image = UIImage(named: "item")
        cell.lblPcs.text =   "1 pcs. "
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 70
    }

    
    
}

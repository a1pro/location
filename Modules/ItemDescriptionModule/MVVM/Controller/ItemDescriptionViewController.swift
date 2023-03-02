//
//  ItemDescriptionViewController.swift
//  Location
//
//  Created by Rakesh on 28/02/23.
//

import UIKit

class ItemDescriptionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Item Description"
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
  

}

//
//  HomeViewController.swift
//  Location
//
//  Created by Rakesh on 27/02/23.
//

import UIKit

class HomeViewController: UIViewController,UISearchBarDelegate{
    
    
    @IBOutlet weak var SearchView: UIView!
    @IBOutlet weak var cameraBtn: UIButton!
    //
//    func title(title: String?) {
//        projectLbl.text = title
//    }
//

    lazy var searchBar:UISearchBar = UISearchBar()

    
    @IBOutlet weak var ProjectTableView: UITableView!
    
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var projectLbl: UILabel!
    var selectedTag = 0
    var titleData : String?
    var filterArray: [String] = []
   
    var colorArray = [UIColor.red,UIColor.orange,UIColor.blue,UIColor.systemPink,UIColor.red]
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        navigationItem.searchController = searchController
        ProjectTableView.delegate = self
        ProjectTableView.dataSource = self
        
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)

        ProjectTableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        ProjectTableView.reloadData()
        
        searchBar.searchBarStyle = UISearchBar.Style.default
            searchBar.placeholder = " Search..."
            searchBar.sizeToFit()
            searchBar.isTranslucent = false
            searchBar.backgroundImage = UIImage()
            searchBar.delegate = self
        searchBar.frame = SearchView.bounds
         SearchView.addSubview(searchBar)
        
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String)
    {
//        if textSearched == ""{
//           filterArray = selectedTag
//        }
//        for word in selectedTag{
//            if word.u
//        }
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        ProjectTableView.reloadData()
    }
  
    @IBAction func cameraBtnAction(_ sender: Any) {
      
        
    }
    
    @IBAction func settingBtnAction(_ sender: Any) {
        
    }
    @IBAction func plusBtnAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "BoxesViewController")as! BoxesViewController
        selectedTag += 1
        vc.titlLbl = titleData
        navigationController?.pushViewController(vc, animated: true)
       
    }
    

}
extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedTag
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath)as! CustomTableViewCell
        let index = " \(indexPath.row+1)"
         cell.titleLbl.text = projectLbl.text?.appending(index)
         self.titleData = cell.titleLbl.text
        cell.lblPcs.isHidden = true
//        if colorArray.count != 0 {
//            cell.colorView.backgroundColor = colorArray[indexPath.row]
//        }else
//        {
            cell.colorView.backgroundColor = .random
//        }
//
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}


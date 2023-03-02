//
//  BoxesViewController.swift
//  Location
//
//  Created by Rakesh on 28/02/23.
//

import UIKit


protocol updateDataOnBoxes{
    func title(title:String?)
}

class BoxesViewController: UIViewController,itemCountDelegate,UISearchBarDelegate{
   
    
   
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var settingBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var plusBtn: UIButton!
   
    @IBOutlet weak var bosexCollectionView: UICollectionView!
    var btnTagProject = 0
    var itemCount = 0
    var titlLbl : String?
    var homeDelegate : updateDataOnBoxes?
    
    lazy var searchBar:UISearchBar = UISearchBar()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        bosexCollectionView.delegate = self
        bosexCollectionView.dataSource = self
        
        let nib = UINib(nibName: "BoxesCollectionViewCell", bundle: nil)

        bosexCollectionView.register(nib, forCellWithReuseIdentifier: "BoxesCollectionViewCell")
        titleLbl.text = titlLbl
        
//        searchBar.searchBarStyle = UISearchBar.Style.default
//            searchBar.placeholder = " Search..."
//            searchBar.sizeToFit()
//            searchBar.isTranslucent = false
//            searchBar.backgroundImage = UIImage()
//            searchBar.delegate = self
//            navigationItem.titleView = searchBar
       
       
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String)
    {
        debugPrint("search bar")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bosexCollectionView.reloadData()
    }
    
    @IBAction func backBtnAction(_ sender: Any) {

        navigationController?.popViewController(animated: true)
        
    }
    func itemCount(count: Int) {
        itemCount = count
       
    }
   
    @IBAction func settingBtnAction(_ sender: Any) {
    }
    
    @IBAction func plusBtnAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ItemViewController")as! ItemViewController
        vc.itemDelegate = self
        navigationController?.pushViewController(vc, animated: true)
        btnTagProject += 1
    }
}
extension BoxesViewController : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return btnTagProject
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoxesCollectionViewCell", for: indexPath)as! BoxesCollectionViewCell
        cell.imgView.image = UIImage(named: "box")
        let index = " \(indexPath.row+1)"
        cell.nameLbl.text = "Box\((index))"
  
        cell.noOfItemLbl.text = "item\(itemCount)"
         return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("coollview seletMethod")
           
                self.bosexCollectionView.reloadItems(at: [indexPath])
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.size.width/5, height: collectionView.frame.size.height/6.5)
    }
    
   
    
}

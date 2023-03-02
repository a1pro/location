//
//  LocationViewController.swift
//  Location
//
//  Created by ios department on 2/24/23.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var locationCollectionView: UICollectionView!
    
    @IBOutlet weak var nextBtn: UIButton!
   var indexP = IndexPath()
    
    var array = ["Projects","Boxes","Items","Everything"]
    
    var onboardingData : [onboardingModel] = [ onboardingModel(typeName: "Start your ", title: "add someThing", description: "add someThing", image: UIImage(named: "splash1"), color: UIColor.blue),onboardingModel(typeName: "Add Your ", title: "add someThing", description: "add someThing", image: UIImage(named: "splash2"), color: UIColor.systemGreen),onboardingModel(typeName: "Add Your ", title: "add someThing", description: "add someThing", image: UIImage(named: "splash3"), color: UIColor.systemYellow),onboardingModel(typeName: "Find ", title: "add someThing", description: "add someThing", image: UIImage(named: "splash2"), color: UIColor.red)]
   
    
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == onboardingData.count - 1{
                nextBtn.setTitle("Continue", for: .normal)
              
               
            }
            else{

                nextBtn.setTitle("Next", for: .normal)
             
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationCollectionView.dataSource = self
        locationCollectionView.delegate = self
        pageControl.numberOfPages = onboardingData.count
        pageControl.hidesForSinglePage = true
        locationCollectionView.isPagingEnabled = true
        nextBtn.layer.cornerRadius = 10
        
       
       
       
   
    }
    
    @IBAction func nextBtnAction(_ sender: UIButton) {
       
        if currentPage == onboardingData.count-1{
            print(pageControl.currentPage)
    
            let HomeVc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController")as! HomeViewController
            UserDefaults.standard.hasOnboarded = true
            navigationController?.pushViewController(HomeVc, animated: true)

        } else {
                    currentPage += 1
           
            let indexPath = IndexPath(item: currentPage, section: 0)

            locationCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }

        }
   
}
extension OnboardingViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingData.count
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath)as! OnboardingCollectionViewCell
        let onboardingData = onboardingData[indexPath.row]
        nextBtn.backgroundColor = onboardingData.color
        pageControl.currentPageIndicatorTintColor = onboardingData.color
       
        cell.configureCell(with: onboardingData)
        
        let attrs1 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 26), NSAttributedString.Key.foregroundColor : UIColor.black]

        let attrs2 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 26), NSAttributedString.Key.foregroundColor : onboardingData.color]

        let attributedString1 = NSMutableAttributedString(string:onboardingData.typeName!, attributes:attrs1)

        let attributedString2 = NSMutableAttributedString(string:array[indexPath.row].description, attributes:attrs2)

        attributedString1.append(attributedString2)
        cell.typeLbl.attributedText = attributedString1
        
        return cell
    }
//
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let offSet = scrollView.contentOffset.x
               let width = scrollView.frame.width
               let horizontalCenter = width / 2

               pageControl.currentPage = Int(offSet + horizontalCenter) / Int(width)
      
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
}



//
//  LocationCollectionViewCell.swift
//  Location
//
//  Created by ios department on 2/24/23.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var typeLbl: UILabel!
    
    
    @IBOutlet weak var descriprtionLbl: UILabel!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func configureCell(with onboardingData: onboardingModel){
        imageView.image = onboardingData.image
        typeLbl.text = onboardingData.typeName
        titleLbl.text = onboardingData.title
        descriprtionLbl.text = onboardingData.description
        
    }
    
}

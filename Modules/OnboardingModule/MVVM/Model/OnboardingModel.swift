//
//  OnboardingModel.swift
//  Location
//
//  Created by Rakesh on 27/02/23.
//

import Foundation
import UIKit

struct onboardingModel {
    var typeName : String?
    var title: String?
    var description : String?
    var image : UIImage?
    var color : UIColor?
    
    init(typeName: String? = nil, title: String? = nil, description: String? = nil, image: UIImage? = nil, color: UIColor? = nil) {
        self.typeName = typeName
        self.title = title
        self.description = description
        self.image = image
        self.color = color
        
        
    }
    
}

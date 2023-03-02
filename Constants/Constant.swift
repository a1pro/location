//
//  Constant.swift
//  CartoonMe
//
//  Created by iApp on 15/07/22.
//

import Foundation


struct API{
    
    static let MainAPIkey = "6337456fe50e4d0bacb194a3a2787c1e" //Tijender Sir // Coutout main api key
//     static let MainAPIkey = "55a0823f1b564d71a454cd8b799045ad" //Pritpal Singh
    
}


enum ToonFeature {
    case enhance
    case toonEffect
    case backgroundRemover
    case faceCutout
    case photoEnhancer
    case photoColorizer
    case imageRetouch // RemoveObject
    case cartoonSelfie
    case passportPhoto
    case photoAnimer
    case photoColorCorrection
   
    
    var title: String{
        switch self {
        case .enhance:
            return "Enhance"
        case .toonEffect:
            return "Toon Effect"
        case .backgroundRemover:
            return "Remove Background"
        case .faceCutout:
            return "Face Cutout"
        case .photoEnhancer:
            return "Photo Enhancer"
        case .photoColorizer:
            return "Photo Colorizer"
        case .imageRetouch:
            return "Image Retouch"
        case .cartoonSelfie:
            return "Cartoon Selfie"
        case .passportPhoto:
            return "Passport Photo"
        case .photoAnimer:
            return "Photo Animer"
        case .photoColorCorrection:
            return "Photo Color Correction"
        }
    }
    
    var imageName: String{
        switch self {
        case .enhance:
            return "ehnance"
        case .toonEffect:
            return "toonEffect"
        case .backgroundRemover:
            return "bgRemove"
        case .faceCutout:
            return "ehnance"
        case .photoEnhancer:
            return "toonEffect"
        case .photoColorizer:
            return "bgRemove"
        case .imageRetouch:
            return "ehnance"
        case .cartoonSelfie:
            return "toonEffect"
        case .passportPhoto:
            return "bgRemove"
        case .photoAnimer:
            return "ehnance"
        case .photoColorCorrection:
            return "toonEffect"
        }
    }
    
    var description: String{
        switch self {
        case .enhance:
            return "Enhance your picture Quality and more more crisp and sharp"
        case .toonEffect:
            return "Create realistic cartoon selfie within seconds"
        case .backgroundRemover:
            return "Create realistic cartoon selfie within seconds"
        case .faceCutout:
            return "Create realistic cartoon selfie within seconds"
        case .photoEnhancer:
            return "Create realistic cartoon selfie within seconds"
        case .photoColorizer:
            return "Create realistic cartoon selfie within seconds"
        case .imageRetouch:
            return "Create realistic cartoon selfie within seconds"
        case .cartoonSelfie:
            return "Create realistic cartoon selfie within seconds"
        case .passportPhoto:
            return "Create realistic cartoon selfie within seconds"
        case .photoAnimer:
            return "Create realistic cartoon selfie within seconds"
        case .photoColorCorrection:
            return "Create realistic cartoon selfie within seconds"
        }
    }
    
}


struct Cell{
    static let toonEffectIdentifier = "ToonEffectCollectionCell"
    static let imageSelectIdentifier = "UseImageCollectionViewCell"
}

//
//  UIImageExtension.swift
//  CartoonMe
//
//  Created by iApp on 20/07/22.
//

import Foundation
import UIKit

extension UIImage{
    func scaleProportionalToSize(size:CGSize) -> UIImage? {
        
        var newSize = size
        let widthRatio = newSize.width / self.size.width
        let heightRatio = newSize.height / self.size.height
        
        if (widthRatio > heightRatio) {
            newSize = CGSize(width: self.size.width * heightRatio, height: self.size.height * heightRatio)
        } else {
            newSize = CGSize(width: self.size.width * widthRatio, height: self.size.height * widthRatio)
        }
        
        return self.resizedImage(newSize)
    }
    
    func resizedImage(_ size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    
    /// Convert UIImage to Base64 String
    /// - Parameter quality: compression is 0(most)..1(least)
    /// - Returns: return image as Base64 . May return nil if image has no CGImageRef or invalid bitmap format
    func toBase64String(_ quality: CGFloat = 1) -> String? {
        return self.jpegData(compressionQuality: quality)?.base64EncodedString()
    }
    //Decode to UIImage
//    func convertBase64StringToImage (imageBase64String:String) -> UIImage {
//        let imageData = Data(base64Encoded: imageBase64String)
//        let image = UIImage(data: imageData!)
//        return image!
//    }
    
    
    func croppedInRect(rect: CGRect) -> UIImage {
        func rad(_ degree: Double) -> CGFloat {
            return CGFloat(degree / 180.0 * .pi)
        }
        
        var rectTransform: CGAffineTransform
        switch imageOrientation {
        case .left:
            rectTransform = CGAffineTransform(rotationAngle: rad(90)).translatedBy(x: 0, y: -self.size.height)
        case .right:
            rectTransform = CGAffineTransform(rotationAngle: rad(-90)).translatedBy(x: -self.size.width, y: 0)
        case .down:
            rectTransform = CGAffineTransform(rotationAngle: rad(-180)).translatedBy(x: -self.size.width, y: -self.size.height)
        default:
            rectTransform = .identity
        }
        rectTransform = rectTransform.scaledBy(x: self.scale, y: self.scale)
        
        guard let imageRef = self.cgImage?.cropping(to: rect.applying(rectTransform)) else{
            return self
        }
        let result = UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)
        return result
    }
    
}

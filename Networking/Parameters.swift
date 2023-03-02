////
////  Parameters.swift
////  CartoonMe
////
////  Created by iApp on 15/07/22.
////
//
//import Foundation
//import UIKit
//
//enum ParameterType {
//
//    case file(_ image: UIImage)
//    
//    //User-provided mask image file converted to base64 string, compatible with single-channel, three-channel, and four-channel black and white images. The area to be repaired is in white and the areas to be untouched are in black. If this entry is provided, the “rectangles” parameter is ignored.
//    case imageFix(_ original: UIImage, _ maskImage: UIImage)
//}
//
//
//extension ParameterType  {
//    var params : [String: Any] {
//        var params = [String:Any]()
//        switch self {
//            
//        case .file(let image):
//            params["file"] = image
//            
//        case .imageFix(let originalImage, let maskImage):
//            params["base64"] = originalImage.toBase64String() //Convert image file to base64 string
//            params["maskBase64"] = maskImage.toBase64String()
//        break
//        }
//        return params
//    }
//}

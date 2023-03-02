//
//  Extension+PHAssets.swift
//  BackgroundChager
//
//  Created by iApp on 24/06/21.
//

import Foundation
import Photos
import UIKit

extension PHAsset {
    var thumbnailImage : UIImage? {
        get {
            let manager = PHImageManager.default()
            let option = PHImageRequestOptions()
            var thumbnail = UIImage()
            option.isSynchronous = true
            manager.requestImage(for: self, targetSize: CGSize(width: 300, height: 300), contentMode: .default, options: option, resultHandler: {(result, info)->Void in
                if result != nil {
                thumbnail = result!
                }
            })
            return thumbnail
        }
    }
    
    func requestImage(for
                      targetSize: CGSize,
                      contentMode: PHImageContentMode,
                      completionHandler: @escaping (UIImage?) -> ()) {
        let imageManager = PHImageManager()
        imageManager.requestImage(for: self,
                                  targetSize: targetSize,
                                  contentMode: contentMode,
                                  options: nil) { (image, _) in
                                      completionHandler(image)
        }
    }
//
//    let asset = // your existing PHAsset
//    let targetSize = CGSize(width: 100, height: 100)
//    let contentModel = PHImageContentMode.aspectFit
//    requestImage(for: asset, targetSize: targetSize, contentMode: contentModel, completionHandler: { image in
//        // Do something with your image if it exists
//    })
    
    
    func getUIImage() -> UIImage? {
     
        var img: UIImage?
        let manager = PHImageManager.default()
        let options = PHImageRequestOptions()
        options.version = .original
        options.isSynchronous = true
        if #available(iOS 13, *) {
            manager.requestImageDataAndOrientation(for: self, options: options) { data, _, _, _ in
                
                if let data = data {
                    img = UIImage(data: data)
                }
            }
        } else {
            // Fallback on earlier versions
            manager.requestImageData(for: self, options: options) { (data, _, _, _) in
                if let data = data {
                    img = UIImage(data: data)
                }
            }
        }

        return img
    }
}

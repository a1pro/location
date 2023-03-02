//
//  ImagePickerManager.swift
//  TextStickerModule
//
//  Created by iApp on 27/01/22.
//

import Foundation
import UIKit
import PhotosUI


class ImagePickerManager: NSObject, PHPickerViewControllerDelegate, UINavigationControllerDelegate {

    var alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
    var viewController: UIViewController?
    var pickImageCallback : ((UIImage?, String?) -> ())?;
    
    override init() {
        super.init()
        
        let galleryAction = UIAlertAction(title: "Gallery", style: .default){
            UIAlertAction in
            self.openGallery()
        }
        //        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){
        //            UIAlertAction in
        //        }
        
        // Add the actions
        alert.addAction(galleryAction)
        //        alert.addAction(cancelAction)
    }

    func openGallery() {
        if #available(iOS 14, *) {
            let photoLibrary = PHPhotoLibrary.shared()
            let configuration = PHPickerConfiguration(photoLibrary: photoLibrary)
            
            let picker = PHPickerViewController(configuration: configuration)
            picker.delegate = self
//            viewController?.present(picker, animated: true)
            viewController?.present(picker, animated: true, completion: nil)
        } else {
            // Fallback on earlier versions
        }
    }
    
    
    func openCamera() {
        if #available(iOS 14, *) {
            let photoLibrary = PHPhotoLibrary.shared()
            let configuration = PHPickerConfiguration(photoLibrary: photoLibrary)
            
            let picker = PHPickerViewController(configuration: configuration)
            picker.delegate = self
//            picker.pr
//            viewController?.present(picker, animated: true)
            viewController?.present(picker, animated: true, completion: nil)
        } else {
            // Fallback on earlier versions
        }
    }
    
    @available(iOS 14, *)
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        // TODO: Do something with the fetch result if you have Photos Library access

        let identifiers = results.compactMap(\.assetIdentifier)
        let fetchResult = PHAsset.fetchAssets(withLocalIdentifiers: identifiers, options: nil)
        
        guard let phAsset = fetchResult.firstObject else {
            pickImageCallback?(nil,nil)
            return
        }
        let fillSize = CGSize(width: 1500, height: 1500)
        phAsset.toImage(size: fillSize) { [weak self] (progress, image) in
            if image != nil {
                self?.pickImageCallback?(image, identifiers.first)
            }
        }
    }
    
    
    func pickImage(_ viewController: UIViewController, _ callback: @escaping ((UIImage?, String?) -> ())) {
        pickImageCallback = callback;
        self.viewController = viewController;
        self.openGallery()
      /*  alert.popoverPresentationController?.sourceView = self.viewController!.view
        alert.popoverPresentationController?.sourceRect = self.viewController!.view.bounds

        viewController.present(alert, animated: true, completion: nil)*/
    }
}

extension PHAsset{
    func toImage(size:CGSize = PHImageManagerMaximumSize,completion: ((Double?,UIImage?) -> Void)?){
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        option.isNetworkAccessAllowed = true
        option.isSynchronous = true
        var isProgressStart = false
        option.progressHandler = {(progress,_,_,_) in
            if !isProgressStart {
                /*Helper.dispatchMain {
                 SwiftLoader.show(animated: true)
                 }*/
                isProgressStart = true
            }
            let percentage = String(Int(progress * 100)) + "%"
            debugPrint("progress",percentage)
            completion?(progress, nil)
        }
        manager.requestImage(for: self, targetSize: size, contentMode: .aspectFit, options: option, resultHandler: {(image, info)->Void in
            completion?(nil,image)
        })
    }
}

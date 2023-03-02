//
//  GalleryPermissions.swift
//  BackgroundChager
//
//  Created by iapp on 06/04/21.
//

import Foundation
import Photos


enum LibraryPermissionStatus {
    
    case authorised
    case denied
    case notDetermined
    
}

struct PhotoLibrary {
    
    //MARK:- Check if Photo Library Access is granted or not.
    
    func checkLibraryPermission(competionHandler: @escaping (_ status: LibraryPermissionStatus)-> Void) {
        
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            competionHandler(.authorised)
        case .denied, .restricted :
            competionHandler(.denied)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { status in
                switch status {
                case .authorized:
                    competionHandler(.authorised)
                case .denied, .restricted:
                    competionHandler(.denied)
                case .notDetermined:
                    competionHandler(.notDetermined)
                default:
                    break
                }
            }
        default:break
        }
    }
    //MARK:- Check if Library Access is granted or not.
    /// if yes then it will return both video and photos
    func fetchGallery(mediaType: PHAssetMediaType, completetion: @escaping(PHFetchResult<PHAsset>?)->()) {
        var assets: PHFetchResult<PHAsset>?
        PhotoLibrary().checkLibraryPermission { (status) in
            switch status {
            case .authorised:
                print("Good to proceed")
                let fetchOptions = PHFetchOptions()
                fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
                if mediaType == .both {
                    fetchOptions.predicate = NSPredicate(format: "mediaType == %d || mediaType == %d",
                                                         PHAssetMediaType.image.rawValue,
                                                         PHAssetMediaType.video.rawValue)
                    assets = PHAsset.fetchAssets(with: fetchOptions)
                } else {
                    fetchOptions.predicate = NSPredicate(format: "mediaType == %d ",
                                                         mediaType.rawValue )
                    assets = PHAsset.fetchAssets(with: fetchOptions)
                }
                completetion(assets)
            case .denied, .notDetermined:
                //                self.showAlert(title: "Alert", message: "Gallery permission denied.")
                completetion(assets)
                break
            }
        }
    }
    
}

enum PHAssetMediaType: Int, CaseIterable {

    case both
    case image
    case video

}


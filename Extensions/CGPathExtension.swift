//
//  CGPathExtension.swift
//  CartoonMe
//
//  Created by iApp on 20/07/22.
//

import Foundation
import CoreGraphics

extension CGPath {
    func resized(to rect: CGRect) -> CGPath {
        let boundingBox = self.boundingBox
        let boundingBoxAspectRatio = boundingBox.width / boundingBox.height
        let viewAspectRatio = rect.width / rect.height
        let scaleFactor = boundingBoxAspectRatio > viewAspectRatio ?
            rect.width / boundingBox.width :
            rect.height / boundingBox.height

        let scaledSize = boundingBox.size.applying(CGAffineTransform(scaleX: scaleFactor, y: scaleFactor))
        let centerOffset = CGSize(
            width: (rect.width - scaledSize.width) / (scaleFactor),
            height: (rect.height - scaledSize.height) / (scaleFactor)
        )

        var transform = CGAffineTransform.identity
            .scaledBy(x: scaleFactor, y: scaleFactor)
            .translatedBy(x: -boundingBox.minX + centerOffset.width, y: -boundingBox.minY + centerOffset.height)

        return copy(using: &transform)!
    }
}

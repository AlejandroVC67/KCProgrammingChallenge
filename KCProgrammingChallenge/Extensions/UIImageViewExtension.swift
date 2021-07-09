//
//  UIImageViewExtension.swift
//  KCProgrammingChallenge
//
//  Created by Alejandro Villa Cardenas
//

import UIKit

extension UIImageView {
    var aspectRatio: CGFloat {
        guard let image = self.image,
              image.size.width > 0 else {
            return 0
        }
        return image.size.height / image.size.width
    }
}

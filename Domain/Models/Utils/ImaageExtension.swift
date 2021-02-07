//
//  ImaageExtension.swift
//  Domain
//
//  Created by Carlos Parada on 7/02/21.
//

import UIKit

extension UIImageView {
    public func roundedImage() {
        self.layer.cornerRadius = (self.frame.size.width) / 2
        self.clipsToBounds = true
    }
}

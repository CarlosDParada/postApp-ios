//
//  ImageOneCollectionViewCell.swift
//  PostApp
//
//  Created by Carlos Parada on 7/02/21.
//

import UIKit

class ImageOneCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var simpleImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func setup(with imageURL: String) {
        simpleImage.kf.indicatorType = .activity
        simpleImage.kf.setImage(with: URL(string: imageURL ))
    }
}

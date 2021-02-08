//
//  ImagePostViewController.swift
//  PostApp
//
//  Created by Carlos Parada on 7/02/21.
//

import UIKit
import Kingfisher

/// Cell del collection View
class ImagePostViewController: UIViewController {

     var imageString: String!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        if imageString != nil {}
        setupImage(with: imageString)
    }

    func setupImage(with postURLImg: String) {
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: URL(string: postURLImg ))
    }

}

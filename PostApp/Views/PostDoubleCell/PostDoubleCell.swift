//
//  PostDoubleCell.swift
//  PostApp
//
//  Created by Carlos Parada on 7/02/21.
//

import UIKit

final class PostDoubleCell: UITableViewCell {

    @IBOutlet weak var postProfile: UIImageView!
    @IBOutlet weak var postUser: UILabel!
    @IBOutlet weak var postEmail: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postImage2: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setup(with viewModel: PostCellViewModel) {
        if let user = viewModel.dataUser {
            postUser.text = user.name
            postEmail.text = user.email
            postProfile.kf.setImage(with: URL(string: user.profilePic ?? ""))
            postProfile.roundedImage()
            if let postOne = user.post {
                postDate.text = postOne.datePost?.parseDateTh()
                if let photo = postOne.picsPost?.first {
                    postImage.kf.indicatorType = .activity
                    postImage.kf.setImage(with: URL(string: photo ))
                    postImage.tag = 1
//                    postImage.addGestureRecognizer(UITapGestureRecognizer(
//                                                    target: self,
//                                                    action: #selector(handleImageSelector(sender:))))
                }
                if let photo = postOne.picsPost?.last {
                    postImage2.kf.indicatorType = .activity
                    postImage2.kf.setImage(with: URL(string: photo ))
                    postImage.tag = 2
//                    postImage2.addGestureRecognizer(UITapGestureRecognizer(
//                                                    target: self,
//                                                    action: #selector(handleImageSelector(sender:))))
                }
            }
        }
    }

    /// Gesto que envia el tag del boton para compartir la imagen
    /// - Parameter sender: Any
    @objc private func handleImageSelector(sender: UIGestureRecognizer) {
        print("Pressed image selector \(sender)")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

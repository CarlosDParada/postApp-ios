//
//  PostMultipleCell.swift
//  PostApp
//
//  Created by Carlos Parada on 7/02/21.
//

import UIKit

final class PostMultipleCell: UITableViewCell {

    @IBOutlet weak var postProfile: UIImageView!
    @IBOutlet weak var postUser: UILabel!
    @IBOutlet weak var postEmail: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var collectViewImages: UICollectionView!
    var groupImages: [String]!

    override func awakeFromNib() {
        super.awakeFromNib()
        //        collectViewImages.delegate = self

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCollection() {
        let imageCell = UINib(nibName: "ImageOneCollectionViewCell", bundle: nil)
        collectViewImages.register(imageCell, forCellWithReuseIdentifier: "ImageOneCollectionViewCell")
        collectViewImages.dataSource = self
        collectViewImages.dataSource = self
    }
    func setup(with viewModel: PostCellViewModel) {
        self.groupImages = viewModel.dataUser?.post?.picsPost
        self.groupImages.removeFirst()
        configureCollection()
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
                }
            }
        }
    }
}

extension PostMultipleCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupImages.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "ImageOneCollectionViewCell", for: indexPath) as? ImageOneCollectionViewCell else {
            return UICollectionViewCell()
        }
        if let imageURL = groupImages?[indexPath.row] {
            cell.setup(with: imageURL)
        }
        return cell
    }

}

extension PostMultipleCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let imageURL = groupImages?[indexPath.row] {
            showPopUpView(with: imageURL)
        }
    }
}

extension PostMultipleCell {
    func showPopUpView(with imageURLstring: String) {
        let imageSimpleViewController = ImagePostViewController(nibName: "ImagePostViewController", bundle: nil)
        imageSimpleViewController.modalPresentationStyle = .popover
        imageSimpleViewController.imageString = imageURLstring
        self.window?.rootViewController?.present(imageSimpleViewController, animated: true, completion: nil)
    }
}

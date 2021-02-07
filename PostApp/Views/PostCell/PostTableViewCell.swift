//
//  PostTableViewCell.swift
//  PostApp
//
//  Created by Carlos Parada on 6/02/21.
//

import Kingfisher
import UIKit
import Domain

struct PostCellViewModel {
    let dataUser: DataUser?
    func fill(on tableView: UITableView) -> UITableViewCell {
        switch self.dataUser?.post?.picsPost?.count {
        case 1:
            guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: "PostTableViewCell") as? PostTableViewCell else {
                return UITableViewCell()
            }
            cell.setup(with: self)
            return cell

        case 2:
            guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: "PostDoubleCell") as? PostDoubleCell else {
                return UITableViewCell()
            }
            cell.setup(with: self)
            return cell

        default:
            guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: "PostMultipleCell") as? PostMultipleCell else {
                return UITableViewCell()
            }
            cell.setup(with: self)
            return cell
        }
    }
    func heightRow (on tableView: UITableView) -> CGFloat {
        switch self.dataUser?.post?.picsPost?.count {
        case 1:
            return tableView.frame.size.width + 30
        case 2:
            return tableView.frame.size.width * 0.6
        default:
            return tableView.frame.size.width * 1.5
        }
    }
}

final class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postProfile: UIImageView!
    @IBOutlet weak var postUser: UILabel!
    @IBOutlet weak var postEmail: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
                }
            }
        }
    }
}

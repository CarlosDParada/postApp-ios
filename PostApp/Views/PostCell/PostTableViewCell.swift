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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as? PostTableViewCell else {
            return UITableViewCell()
        }
        cell.setup(with: self)
        return cell
    }
    func heightRow (on tableView: UITableView) -> CGFloat {
        return tableView.frame.size.width + 30
    }
}

final class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postProfile: UIImageView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postUser: UILabel!
    @IBOutlet weak var postEmail: UILabel!
    @IBOutlet weak var postDate: UILabel!
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
                postDate.text = self.parseDate(with: postOne.datePost ?? "")
                if let photo = postOne.picsPost?.first {
                    postImage.kf.indicatorType = .activity
                    postImage.kf.setImage(with: URL(string: photo ))
                }
            }
        }
    }
    func parseDate(with dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  FormatDate.inputPost
        let dataShort = String(dateString.dropLast(25))
        if let date = dateFormatter.date(from: dataShort) {
            let dateFormatter2 = DateFormatter()
            dateFormatter2.dateFormat = date.dateFormatWithSuffix()
            return dateFormatter2.string(from: date)
        }
        return dateFormatter.string(from: Date())
    }
}

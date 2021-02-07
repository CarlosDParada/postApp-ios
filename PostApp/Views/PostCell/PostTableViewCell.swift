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
//        postUser.text = viewModel.dataUser?.name
//        postProfile.kf.setImage(with: viewModel.dataUser.profilePic)

    }
}

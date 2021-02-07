//
//  PostTableViewCell.swift
//  PostApp
//
//  Created by Carlos Parada on 6/02/21.
//

import UIKit

struct PostCellViewModel {
    let imageURL: URL?
    let name: String
    let number: String
    let types: [String]
    func fill(on tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView
                .dequeueReusableCell(withIdentifier: "PostTableViewCell") as? PostTableViewCell else {
            return UITableViewCell()
        }
        cell.setup(with: self)
        return cell
    }
}

class PostTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(with viewModel: PokemonCellViewModel) {
    }
}

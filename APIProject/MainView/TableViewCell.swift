//
//  TableViewCell.swift
//  APIProject
//
//  Created by User-P2 on 8/30/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var modelImage: UIImageView!
    @IBOutlet weak var modelName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//
//  TableViewCell.swift
//  APIProject
//
//  Created by User-P2 on 8/30/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet var imageUI: UIImageView!
    @IBOutlet var nameUI: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUp(character: Character!) {
        nameUI.text = character.name
        imageUI.sd_setImage(with: URL(string: character!.image), placeholderImage: UIImage(contentsOfFile: "loading-image"))
    }
    
}

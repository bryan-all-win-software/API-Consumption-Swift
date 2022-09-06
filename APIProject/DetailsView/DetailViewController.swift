//
//  DetailViewController.swift
//  APIProject
//
//  Created by User-P2 on 8/30/22.
//

import UIKit
import SDWebImage

final class DetailViewController: UIViewController{
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var deescription: UILabel!
    
    var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        image.sd_setImage(with: URL(string: character!.image), placeholderImage: UIImage(contentsOfFile: "loading-image"))
        name.text = character?.name
        deescription.text = ("This character has a \(character!.hairColor) hair, .")
    }
    
}

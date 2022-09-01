//
//  DetailViewController.swift
//  APIProject
//
//  Created by User-P2 on 8/30/22.
//

import UIKit
import SDWebImage
class DetailViewController: UIViewController{
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var deescription: UILabel!
    
    var character: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = image.getImage(urlString: character!.image)
        name.text = character?.name
        deescription.text = ("This character has a \(character!.hairColor) hair.")
    }
    
}

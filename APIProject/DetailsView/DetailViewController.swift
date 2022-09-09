//
//  DetailViewController.swift
//  APIProject
//
//  Created by User-P2 on 8/30/22.
//

import UIKit
import SDWebImage

final class DetailViewController: UIViewController {
    
    @IBOutlet private var image: UIImageView!
    @IBOutlet private var name: UILabel!
    @IBOutlet private var deescription: UILabel!
    
    var character: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        image.sd_setImage(with: URL(string: character!.image), placeholderImage: UIImage(contentsOfFile: "loading-image"))
        name.text = character?.name
        deescription.text = ("Hair Color: \(character?.hairColor ?? "unknown") \nGender: \(character?.gender ?? "doubtful")\nOcupation: \(character?.occupation ?? "is lazy")\nAge: \(character?.age ?? "unknown")")
    }
    
}

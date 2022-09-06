//
//  ViewController.swift
//  APIProject
//
//  Created by User-P2 on 8/26/22.
//

import UIKit
import SDWebImage

final class ViewController: UIViewController {

    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    var apiManager = ApiManager()
    var character: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        apiManager.delegate = self
        tableView.delegate = self
        tableView.rowHeight = 100
        tableView.dataSource = self
        apiManager.getData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        character.count
    }
    
    /**?
     
     @param UITableView
     @return UITableViewCell
     
     **/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let characterSelected = character[indexPath.row]
        let cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
        SDWebImageManager.shared.loadImage(with: URL(string: characterSelected.image), options: .retryFailed, progress: nil) { image, _, _, _, _,  _ in
            configuration.image = image
            cell.contentConfiguration = configuration
        }
        configuration.text = characterSelected.name
        cell.contentConfiguration = configuration
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DetailViewController()
        viewController.character = character[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

extension ViewController: ManagerDelegate {
    
    func getCharacter(character: [Character]) {
        self.character = character
        reloadData()
    }
    
}

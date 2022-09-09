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
    @IBOutlet private weak var characterTableView: UITableView!
    
    private var apiManager = ApiManager()
    private var character: [Character] = []
    private var characterLeaked: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        apiManager.delegate = self
        searchBar.delegate = self
        characterTableView.delegate = self
        characterTableView.rowHeight = 100
        characterTableView.dataSource = self
        apiManager.getData()
    }
}

extension ViewController: ManagerDelegate, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Gets the array of characters from the API Manager delegate
    func getCharacter(character: [Character]) {
        self.character = character
        DispatchQueue.main.async {
            self.characterLeaked = self.character
            self.characterTableView.reloadData()
        }
    }
    
    //MARK: looks for a character in the copy array of the main array and assigns it to show
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        characterLeaked = []
        if searchText.isEmpty {
            characterLeaked = character
        } else {
            for char in character {
                if char.name.lowercased().contains(searchText.lowercased()) {
                    characterLeaked.append(char)
                }
            }
        }
        self.characterTableView.reloadData()
    }
    
    //MARK: Return cell number that the TableView will contains to show
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characterLeaked.count
    }
    
    //MARK: cell configuration return
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let characterSelected = characterLeaked[indexPath.row]
        let cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
        SDWebImageManager.shared.loadImage(with: URL(string: characterSelected.image), options: .retryFailed, progress: nil) { image, _, _, _, _,  _ in
            configuration.image = image
            cell.contentConfiguration = configuration
        }
        configuration.text = characterSelected.name
        cell.contentConfiguration = configuration
        cell.selectionStyle = .none
        return cell
    }
    
    
    //MARK: Sent to DetailViewController with the character selected by the user
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.character = characterLeaked[indexPath.row]
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}

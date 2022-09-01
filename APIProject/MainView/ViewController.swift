//
//  ViewController.swift
//  APIProject
//
//  Created by User-P2 on 8/26/22.
//

import UIKit
import SDWebImage
class ViewController: UIViewController {

    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    var apiManager = ApiManager()
    var character: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Resgister Cell in tableView
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        apiManager.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        //Show model list with "print from "Project Manager""
        apiManager.getData()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return character.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let characterSelected = character[indexPath.row]
        cell.modelName.text = characterSelected.name
        
        //Getting image
        cell.modelImage.image = cell.modelImage.getImage(urlString: characterSelected.image)
        return cell
    }
    

    
    //Show Datails View
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Selected Row method
        let viewController = DetailViewController()
        viewController.character = character[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    //Search Bar function
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //Some coding in progress
    }
}

extension ViewController: managerDelegate{
    func showModelList(list: [Character]) {
        character = list
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

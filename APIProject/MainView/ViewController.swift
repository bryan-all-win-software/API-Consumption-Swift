//
//  ViewController.swift
//  APIProject
//
//  Created by User-P2 on 8/26/22.
//

import UIKit

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

extension ViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        character.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?  TableViewCell else { fatalError("Cell not find") }
        cell.setUp(character: character[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DetailViewController()
        viewController.character = character[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func reloadData(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

extension ViewController: ManagerDelegate {
    func showModelList(characters: [Character]) {
        character = characters
        reloadData()
    }
}

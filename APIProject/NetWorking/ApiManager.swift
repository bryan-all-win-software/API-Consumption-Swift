//
//  ProjectManager.swift
//  APIProject
//
//  Created by User-P2 on 8/26/22.
import UIKit

protocol ManagerDelegate {
    func showModelList(characters: [Character])
}

final public class ApiManager {
    var delegate: ManagerDelegate?
    
    func getData() {
        guard let url = URL(string: "https://bobsburgers-api.herokuapp.com/characters/?limit=9&skip=6") else { return }
        URLSession.shared.dataTask(with: url) { urlData, urlResponse, urlError in
            if let urlError = urlError {
                print("There data task error for: ", urlError)
            } else if let urlData = urlData, let _ = urlResponse {
                do {
                    let modelList = try JSONDecoder().decode([Character].self, from: urlData)
                    self.delegate?.showModelList(characters: modelList)
                } catch {
                    print("Decode error for: ", error)
                }
            }
        }.resume()
    }
}

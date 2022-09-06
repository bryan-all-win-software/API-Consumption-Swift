//
//  ProjectManager.swift
//  APIProject
//
//  Created by User-P2 on 8/26/22.

import UIKit

protocol ManagerDelegate {
    func getCharacter(character: [Character])
}

final class ApiManager {
    var delegate: ManagerDelegate?
    
    func getData() {
        guard let url = URL(string: "https://bobsburgers-api.herokuapp.com/characters/?limit=9&skip=6") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("There data task error for: ", error.localizedDescription)
            } else if let data = data, let _ = response {
                do {
                    let character = try JSONDecoder().decode([Character].self, from: data)
                    self.delegate?.getCharacter(character: character)
                } catch {
                    print("Decode error for: ", error)
                }
            }
        }.resume()
    }
    
}

//
//  ProjectManager.swift
//  APIProject
//
//  Created by User-P2 on 8/26/22.
//https://youtu.be/Uokamj2WtxU?t=1000

import Foundation
import UIKit
import SDWebImage
protocol managerDelegate {
    func showModelList(list: [Character])
}

class ApiManager {
    
    var delegate: managerDelegate?
    
    func getData() {
        let urlString = URL(string: "https://bobsburgers-api.herokuapp.com/characters/?limit=9&skip=6")
        URLSession.shared.dataTask(with: urlString!) { urlData, urlResponse, urlError in
            if let urlError = urlError {
                print("There is an URL error for: ", urlError.localizedDescription)
            }else if let urlData = urlData, let _ = urlResponse {
                do {
                    let modelList = try JSONDecoder().decode([Character].self, from: urlData)
                    self.delegate?.showModelList(list: modelList)
                }catch{
                    print("Decode error for: ", error.self)
                }
            }
        }.resume()
    }
}


extension UIImageView{
    func getImage(urlString: String) -> UIImage?{
        guard let url = URL(string: urlString) else { return UIImage() }
            DispatchQueue.main.async {
                if let dataImage = try? Data(contentsOf: url){
                    let loadedImage = UIImage(data: dataImage)
                        self.image = loadedImage
                }
            }
        return self.image
    }
}


//public func getImage(urlString: String) -> UIImage {
//    var mainImage = UIImage()
//    if let urlImage = URL(string: urlString) {
//        URLSession.shared.dataTask(with: urlImage) { data, response, error in
//            guard
//                let dataImage = data,
//                let image = UIImage(data: dataImage)
//            else { return  }
//            mainImage =  image
//        }.resume()
//        }
//    return mainImage
//    }
//
//}

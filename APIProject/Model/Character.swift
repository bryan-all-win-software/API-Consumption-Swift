//
//  Model.swift
//  APIProject
//
//  Created by User-P2 on 8/26/22.
//

import Foundation

struct Character: Decodable {
    let id: Int
    let name: String
    let image: String
    let gender: String?
    let hairColor: String?
    let occupation: String?
    let age: String?
}

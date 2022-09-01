//
//  Model.swift
//  APIProject
//
//  Created by User-P2 on 8/26/22.
//

//API: https://bobs-burgers-api-ui.herokuapp.com/

import Foundation

struct Character: Decodable {
    let id: Int
    let name: String
    let image: String
    let gender: String
    let hairColor: String
}

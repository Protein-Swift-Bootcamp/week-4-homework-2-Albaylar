//
//  DetailModel.swift
//  Project2
//
//  Created by Furkan Deniz Albaylar on 5.01.2023.
//

import Foundation

struct CarDetail : Decodable {
    let id : Int
    let year : Int
    let make : String
    let model : String
    let type : String
    
    
private enum CodingKeys : String, CodingKey {
        case id = "id"
        case year = "year"
        case make = "make"
        case model = "model"
        case type = "type"
    }
}

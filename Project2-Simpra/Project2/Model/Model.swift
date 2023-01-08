//
//  Model.swift
//  Project2
//
//  Created by Furkan Deniz Albaylar on 30.12.2022.
//

import Foundation

// This data set should be decodable or codable because we want to fetch data.
struct Car : Decodable {
    let id : Int?
    let year : Int?
    let make : String?
    let model : String?
    let type : String?
    
    
private enum CodingKeys : String, CodingKey {
        case id = "id"
        case year = "year"
        case make = "make"
        case model = "model"
        case type = "type"
    }
}


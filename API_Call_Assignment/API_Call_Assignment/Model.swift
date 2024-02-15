//
//  Model.swift
//  API_Call_Assignment
//
//  Created by promact on 15/02/24.
//

import Foundation

struct IPData:Decodable{
    let ip: String
    let city: String
    let region: String
    let country: String
    let loc: String
    let org: String
    let postal: String
    let timezone: String
    let readme: String
}

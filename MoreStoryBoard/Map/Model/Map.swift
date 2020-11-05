//
//  Map.swift
//  Jome17Wave_iOS
//
//  Created by SAM on 2020/11/3.
//

import Foundation

struct Map: Codable {
    let id: Int
    let name: String
    let side: String?
    let type: String?
    let direction: String?
    let level: String?
    let tidal: String?
    let latitude: Double?
    let longitude: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case side
        case type
        case direction
        case level
        case tidal
        case latitude
        case longitude
    }
}

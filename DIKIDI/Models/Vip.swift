//
//  Vip.swift
//  DIKIDI
//
//  Created by Андрей Паутов on 12.10.2021.
//

import Foundation

class Vip: Codable {
    internal init(id: String, categories: [JSONAny], image: ImageModel, name: String) {
        self.id = id
        self.categories = categories
        self.image = image
        self.name = name
    }
    
    let id: String
    let categories: [JSONAny]
    let image: ImageModel
    let name: String
}


//
//  Vip.swift
//  DIKIDI
//
//  Created by Андрей Паутов on 12.10.2021.
//

import Foundation

class Vip: Codable {
    let id: String?
    let categories: [JSONAny]?
    let image: ImageModels?
    let name: String?

    init(id: String?, categories: [JSONAny]?, image: ImageModels?, name: String?) {
        self.id = id
        self.categories = categories
        self.image = image
        self.name = name
    }
}

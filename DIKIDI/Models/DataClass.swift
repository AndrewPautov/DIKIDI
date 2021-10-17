//
//  DataClass.swift
//  DIKIDI
//
//  Created by Андрей Паутов on 12.10.2021.
//

import Foundation

class DataClass: Codable {
    let blocks: Blocks?
    let title: String?
    let image: String?
    let catalogCount: String?

    enum CodingKeys: String, CodingKey {
        case blocks, title, image
        case catalogCount = "catalog_count"
    }

    init(blocks: Blocks?, title: String?, image: String?, catalogCount: String?) {
        self.blocks = blocks
        self.title = title
        self.image = image
        self.catalogCount = catalogCount
    }
}

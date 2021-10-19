//
//  Blocks.swift
//  DIKIDI
//
//  Created by Андрей Паутов on 12.10.2021.
//

import Foundation

class Blocks: Codable {
    internal init(new: [JSONAny], popular: [JSONAny], banners: [JSONAny], categories: [JSONAny], favorites: [JSONAny], examples: String, vip: [Vip], catalog: [Catalog]) {
        self.new = new
        self.popular = popular
        self.banners = banners
        self.categories = categories
        self.favorites = favorites
        self.examples = examples
        self.vip = vip
        self.catalog = catalog
    }
    
    let new, popular, banners, categories: [JSONAny]
    let favorites: [JSONAny]
    let examples: String
    let vip: [Vip]
    let catalog: [Catalog]
}

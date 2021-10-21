//
//  Currency.swift
//  DIKIDI
//
//  Created by Андрей Паутов on 12.10.2021.
//

import Foundation

class Currency: Codable {
    internal init(id: String, title: String, abbr: String) {
        self.id = id
        self.title = title
        self.abbr = abbr
    }
    let id, title, abbr: String
}

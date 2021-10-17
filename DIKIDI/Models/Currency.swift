//
//  Currency.swift
//  DIKIDI
//
//  Created by Андрей Паутов on 12.10.2021.
//

import Foundation

class Currency: Codable {
    let id, title, abbr: String?

    init(id: String?, title: String?, abbr: String?) {
        self.id = id
        self.title = title
        self.abbr = abbr
    }
}

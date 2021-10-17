//
//  Errors.swift
//  DIKIDI
//
//  Created by Андрей Паутов on 12.10.2021.
//

import Foundation

class Error: Codable {
    let message: JSONNull?
    let code: Int?

    init(message: JSONNull?, code: Int?) {
        self.message = message
        self.code = code
    }
}

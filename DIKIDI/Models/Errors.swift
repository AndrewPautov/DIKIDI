//
//  Errors.swift
//  DIKIDI
//
//  Created by Андрей Паутов on 12.10.2021.
//

import Foundation

class Error: Codable {
    internal init(message: JSONNull?, code: Int) {
        self.message = message
        self.code = code
    }
    
    let message: JSONNull?
    let code: Int
}

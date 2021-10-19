//
//  Dikidi.swift
//  DIKIDI
//
//  Created by Андрей Паутов on 12.10.2021.
//

import Foundation

class Dikidi: Codable {
    internal init(error: Error, data: DataClass) {
        self.error = error
        self.data = data
    }
    
    let error: Error
    let data: DataClass
}

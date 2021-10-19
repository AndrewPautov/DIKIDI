//
//  Image.swift
//  DIKIDI
//
//  Created by Андрей Паутов on 12.10.2021.
//

import Foundation

class ImageModel: Codable {
    internal init(thumb: String, origin: String) {
        self.thumb = thumb
        self.origin = origin
    }
    
    let thumb, origin: String
}

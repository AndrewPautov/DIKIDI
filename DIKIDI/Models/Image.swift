//
//  Image.swift
//  DIKIDI
//
//  Created by Андрей Паутов on 12.10.2021.
//

import Foundation

class ImageModels: Codable  {
    let thumb, origin: String?

    init(thumb: String?, origin: String?) {
        self.thumb = thumb
        self.origin = origin
    }
}


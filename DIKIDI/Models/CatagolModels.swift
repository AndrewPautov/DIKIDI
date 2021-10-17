//
//  CatagolModels.swift
//  DIKIDI
//
//  Created by Андрей Паутов on 12.10.2021.
//

import Foundation

class Catalog: Codable {
    let id: String?
    let schedule: [Schedule]?
    let categories: [JSONAny]?
    let rating: Double?
    let currency: Currency?
    let street, lat: String?
    let image: ImageModels?
    let lng: String?
    let isMaster: Bool?
    let name, house: String?

    init(id: String?, schedule: [Schedule]?, categories: [JSONAny]?, rating: Double?, currency: Currency?, street: String?, lat: String?, image: ImageModels?, lng: String?, isMaster: Bool?, name: String?, house: String?) {
        self.id = id
        self.schedule = schedule
        self.categories = categories
        self.rating = rating
        self.currency = currency
        self.street = street
        self.lat = lat
        self.image = image
        self.lng = lng
        self.isMaster = isMaster
        self.name = name
        self.house = house
    }
}

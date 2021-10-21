//
//  CatagolModels.swift
//  DIKIDI
//
//  Created by Андрей Паутов on 12.10.2021.
//

import Foundation

class Catalog: Codable {
    internal init(id: String, schedule: ScheduleUnion, categories: [JSONAny], rating: Double, currency: Currency, street: String, lat: String, image: ImageModel, lng: String, isMaster: Bool, name: String, house: String, masterID: String?) {
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
        self.masterID = masterID
    }

    let id: String
    let schedule: ScheduleUnion
    let categories: [JSONAny]
    let rating: Double
    let currency: Currency
    let street, lat: String
    let image: ImageModel
    let lng: String
    let isMaster: Bool
    let name, house: String
    let masterID: String?

    enum CodingKeys: String, CodingKey {
        case id, schedule, categories, rating, currency, street, lat, image, lng, isMaster, name, house
        case masterID = "master_id"
    }
}

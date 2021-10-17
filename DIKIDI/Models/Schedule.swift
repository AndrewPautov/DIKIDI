//
//  Schedule.swift
//  DIKIDI
//
//  Created by Андрей Паутов on 12.10.2021.
//

import Foundation

class Schedule: Codable {
    let day, workFrom, workTo: String?

    enum CodingKeys: String, CodingKey {
        case day
        case workFrom = "work_from"
        case workTo = "work_to"
    }

    init(day: String?, workFrom: String?, workTo: String?) {
        self.day = day
        self.workFrom = workFrom
        self.workTo = workTo
    }
}

//
//  Schedule.swift
//  DIKIDI
//
//  Created by Андрей Паутов on 12.10.2021.
//

import Foundation

enum ScheduleUnion: Codable {
    case bool(Bool)
    case scheduleElementArray([ScheduleElement])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Bool.self) {
            self = .bool(x)
            return
        }
        if let x = try? container.decode([ScheduleElement].self) {
            self = .scheduleElementArray(x)
            return
        }
        throw DecodingError.typeMismatch(ScheduleUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ScheduleUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let x):
            try container.encode(x)
        case .scheduleElementArray(let x):
            try container.encode(x)
        }
    }
}

class ScheduleElement: Codable {
    internal init(day: String, workFrom: String, workTo: String) {
        self.day = day
        self.workFrom = workFrom
        self.workTo = workTo
    }

    let day, workFrom, workTo: String

    enum CodingKeys: String, CodingKey {
        case day
        case workFrom = "work_from"
        case workTo = "work_to"
    }
}

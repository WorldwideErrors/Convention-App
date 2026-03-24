import Foundation
import SwiftData

@Model
class Event {
    @Attribute(.unique) var id: Int
    var name: String
    var bio: String
    var start: Date
    var end: Date
    var location: Location
    var category: Category
    var signed_up: Bool = false

    init(id: Int, name: String, bio: String, start: Date, end: Date, location: Location, category: Category, signed_up: Bool = false) {
        self.id = id
        self.name = name
        self.bio = bio
        self.start = start
        self.end = end
        self.location = location
        self.category = category
        self.signed_up = signed_up
    }
}

enum Category: String, Codable, CaseIterable, Identifiable {
    case workshop
    case meeting
    case gaming

    var id: String { rawValue }
}

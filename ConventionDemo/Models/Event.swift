import Foundation

struct Event: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let description: String
    let start: Date
    let end: Date
    let location: Location
    let category: Category
}

enum Category: String, Codable, Identifiable, Hashable {
    case workshop
    case meeting
    case gaming
    
    var id: String { rawValue }
}

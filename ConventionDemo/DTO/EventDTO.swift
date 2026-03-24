import Foundation
import SwiftData

struct EventDTO: Codable {
    let id: Int
    let name: String
    let bio: String
    let start: Date
    let end: Date
    let location: LocationDTO
    let category: Category
}

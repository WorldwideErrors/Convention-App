struct Location: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let area: Area
}

struct Area: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
}

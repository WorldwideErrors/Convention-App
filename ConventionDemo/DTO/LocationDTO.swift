struct LocationDTO: Codable {
    let id: Int
    let name: String
    let area: AreaDTO
}

struct AreaDTO: Codable {
    let id: Int
    let name: String
}

struct ExhibitorDTO: Codable {
    let id: Int
    let name: String
    let bio: String
    let image: String?
    let location: LocationDTO
    let url: String?
}

struct Exhibitor: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let description: String
    let image: String?
//    let location: Location
    let URL: String?
}

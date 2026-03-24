import SwiftData

@Model
class Exhibitor{
    @Attribute(.unique) var id: Int
    var name: String
    var bio: String
    var image: String?
    var location: Location
    var url: String?
    
    init(id: Int, name: String, bio: String, image: String? = nil, url: String? = nil, location: Location) {
        self.id = id
        self.name = name
        self.bio = bio
        self.image = image
        self.url = url
        self.location = location
    }
    
}

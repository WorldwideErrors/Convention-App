import SwiftData

@Model
class Guest{
    @Attribute(.unique) var id: Int
    var name: String
    var bio: String
    var image: String
    var role: String
    
    init(id: Int, name: String, bio: String, image: String, role: String) {
        self.id = id
        self.name = name
        self.bio = bio
        self.image = image
        self.role = role
    }
}

import SwiftData

@Model
class Area {
    @Attribute(.unique) var id: Int
    var name: String

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

@Model
class Location {
    @Attribute(.unique) var id: Int
    var name: String

    @Relationship var area: Area

    init(id: Int, name: String, area: Area) {
        self.id = id
        self.name = name
        self.area = area
    }
}

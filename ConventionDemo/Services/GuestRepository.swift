import Foundation

struct GuestRepository {
    // load all guests
    static func loadGuests() -> [Guest] {
        guard let url = Bundle.main.url(forResource: "guests", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let guests = try? JSONDecoder().decode([Guest].self, from: data) else {
            return []
        }
        return guests
    }
    
    // Get specific guest
    static func getGuest(withId id: Int) -> Guest? {
        let guests = loadGuests()
        return guests.first(where: { $0.id == id })
    }
}

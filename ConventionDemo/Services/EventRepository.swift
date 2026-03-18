import Foundation
//  conventionapp://event/1
func loadEvents() -> [Event] {
    guard let url = Bundle.main.url(forResource: "events", withExtension: "json") else {
        print("JSON file not found")
        return []
    }
    
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        return try decoder.decode([Event].self, from: data)
    } catch {
        print("Decoding error:", error)
        return []
    }
}

// URL: conventionapp://event/{id}
func getEventByID(from code: String) -> Event? {
    let events = loadEvents()
    
    guard let url = URL(string: code) else { return nil }
    
    if url.scheme == "conventionapp",
       url.host == "event",
       let id = Int(url.lastPathComponent) {
        
        return events.first(where: { $0.id == id })
    }
    
    return nil
}

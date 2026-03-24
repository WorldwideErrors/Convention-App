import Foundation
import SwiftData

//  conventionapp://event/1
struct EventRepository {
    // Seed database from JSON (ONLY once)
    static func seedIfNeeded(context: ModelContext) {

            // Check if already seeded
            let descriptor = FetchDescriptor<Event>()
            if let existing = try? context.fetch(descriptor),
               !existing.isEmpty {
                print("Events already seeded")
                return
            }

            // Load JSON
            guard let url = Bundle.main.url(forResource: "events", withExtension: "json") else {
                print("Events.json not found")
                return
            }

            do {
                let data = try Data(contentsOf: url)

                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601

                let eventDTOs = try decoder.decode([EventDTO].self, from: data)

                // Helpers
                func getOrCreateArea(_ dto: AreaDTO) -> Area {
                    let descriptor = FetchDescriptor<Area>(
                        predicate: #Predicate { $0.id == dto.id }
                    )

                    if let existing = try? context.fetch(descriptor).first {
                        return existing
                    }

                    let area = Area(id: dto.id, name: dto.name)
                    context.insert(area)
                    return area
                }

                func getOrCreateLocation(_ dto: LocationDTO, area: Area) -> Location {
                    let descriptor = FetchDescriptor<Location>(
                        predicate: #Predicate { $0.id == dto.id }
                    )

                    if let existing = try? context.fetch(descriptor).first {
                        return existing
                    }

                    let location = Location(
                        id: dto.id,
                        name: dto.name,
                        area: area
                    )

                    context.insert(location)
                    return location
                }

                // Map and insert
                for dto in eventDTOs {

                    let area = getOrCreateArea(dto.location.area)
                    let location = getOrCreateLocation(dto.location, area: area)

                    let event = Event(
                        id: dto.id,
                        name: dto.name,
                        bio: dto.bio,
                        start: dto.start,
                        end: dto.end,
                        location: location,
                        category: dto.category
                    )

                    context.insert(event)
                }

                // Save data
                try context.save()
                print("Events seeded successfully: \(eventDTOs.count)")

            } catch {
                print("Seeding failed:")
                print(error)
            }
        }
    
    static func getEventByID(from code: String, context: ModelContext) -> Event? {

        guard let url = URL(string: code),
              url.scheme == "conventionapp",
              url.host == "event",
              let id = Int(url.lastPathComponent) else {
            return nil
        }

        let descriptor = FetchDescriptor<Event>(
            predicate: #Predicate { $0.id == id }
        )

        return try? context.fetch(descriptor).first
    }
}

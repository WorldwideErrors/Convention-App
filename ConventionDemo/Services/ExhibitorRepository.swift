import Foundation
import SwiftData

struct ExhibitorRepository {
    // Seed database from JSON (ONLY once)
    private static let userDefaultsKey = "exhibitor_seed_version"
    private static let seedVersion = SeedConfig.exhibitorSeedVersion
    
    static func seedIfNeeded(context: ModelContext) {
        // Check if data already exists
        let savedVersion = UserDefaults.standard.integer(forKey: userDefaultsKey)

        if savedVersion == seedVersion {
            print("Exhibitors already seeded")
            return
        }
        
        // Load JSON
        guard let url = Bundle.main.url(forResource: "exhibitors", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let exhibitorDTOs = try? JSONDecoder().decode([ExhibitorDTO].self, from: data) else {
            print("Failed to load JSON")
            return
        }
        
        //Helpers
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
        for dto in exhibitorDTOs {
            let area = getOrCreateArea(dto.location.area)
            let location = getOrCreateLocation(dto.location, area: area)
            
            let exhibitor = Exhibitor(
                id: dto.id,
                name: dto.name,
                bio: dto.bio,
                image: dto.image,
                url: dto.url,
                location: location
            )
            
            context.insert(exhibitor)
        }
        
        // Save data
        do {
            try context.save()
            UserDefaults.standard.set(seedVersion, forKey: userDefaultsKey)

            print("Exhibitors seeded successfully: \(exhibitorDTOs.count)")
        } catch {
            print("Save failed: ", error)
        }
    }
}

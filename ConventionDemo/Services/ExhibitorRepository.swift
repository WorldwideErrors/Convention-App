import Foundation
import SwiftData

struct ExhibitorRepository {
    // Seed database from JSON (ONLY once)
    static func seedIfNeeded(context: ModelContext) {
        // Check if data already exists
        let descriptor = FetchDescriptor<Exhibitor>()
        if let existing = try? context.fetch(descriptor),
           !existing.isEmpty {
            return
        }
        
        // Load JSON
        guard let url = Bundle.main.url(forResource: "exhibitors", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let exhibitorDTOs = try? JSONDecoder().decode([ExhibitorDTO].self, from: data) else {
            print("Failed to load JSON")
            return
        }
        
        // Map and insert
        for dto in exhibitorDTOs {
            let exhibitor = Exhibitor(
                id: dto.id,
                name: dto.name,
                bio: dto.bio,
                image: dto.image,
                url: dto.url
            )
            
            context.insert(exhibitor)
        }
        
        // Save data
        do {
            try context.save()
            print("Exhibitors seeded")
        } catch {
            print("Save failed: ", error)
        }
    }
}

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
            UserDefaults.standard.set(seedVersion, forKey: userDefaultsKey)

            print("Exhibitors seeded successfully: \(exhibitorDTOs.count)")
        } catch {
            print("Save failed: ", error)
        }
    }
}

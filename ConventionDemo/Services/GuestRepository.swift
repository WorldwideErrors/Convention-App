import Foundation
import SwiftData

struct GuestRepository {
    private static let userDefaultsKey = "guest_seed_version"
    private static let seedVersion = SeedConfig.guestSeedVersion
    
    // Seed database from JSON (ONLY once)
    static func seedIfNeeded(context: ModelContext) {
        let savedVersion = UserDefaults.standard.integer(forKey: userDefaultsKey)

        if savedVersion == seedVersion {
            print("Guests already seeded")
            return
        }
        
        // Load JSON
        guard let url = Bundle.main.url(forResource: "guests", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let guestDTOs = try? JSONDecoder().decode([GuestDTO].self, from: data) else {
            print("Failed to load JSON")
            return
        }
        
        // Map and insert
        for dto in guestDTOs {
            let guest = Guest(
                id: dto.id,
                name: dto.name,
                bio: dto.bio,
                image: dto.image,
                role: dto.role
            )
            
            context.insert(guest)
        }
        
        // Save data
        do {
            try context.save()
            UserDefaults.standard.set(seedVersion, forKey: userDefaultsKey)

            print("Guests seeded successfully: \(guestDTOs.count)")
        } catch {
            print("Save failed: ", error)
        }
    }
    
    
}

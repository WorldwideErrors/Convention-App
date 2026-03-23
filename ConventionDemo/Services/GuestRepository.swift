import Foundation
import SwiftData

struct GuestRepository {
    // Seed database from JSON (ONLY once)
    static func seedIfNeeded(context: ModelContext) {
        // Check if data already exists
        let descriptor = FetchDescriptor<Guest>()
        if let existing = try? context.fetch(descriptor),
           !existing.isEmpty {
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
            print("Guests seeded")
        } catch {
            print("Save failed: ", error)
        }
    }
    
    
}

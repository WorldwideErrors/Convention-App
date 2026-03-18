import Foundation

struct ExhibitorRepository {
    // load all exhibitors
    static func loadExhibitors() -> [Exhibitor] {
        guard let url = Bundle.main.url(forResource: "exhibitors", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let exhibitors = try? JSONDecoder().decode([Exhibitor].self, from: data) else {
            return []
        }
        return exhibitors
    }
    
    // Get specific guest
    static func getExhibitor(withId id: Int) -> Exhibitor? {
        let exhibitors = loadExhibitors()
        return exhibitors.first(where: { $0.id == id })
    }
}

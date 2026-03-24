import SwiftUI
import SwiftData

@main
struct ConventionDemoApp: App {
    let container: ModelContainer

    init() {
        container = try! ModelContainer(for: Guest.self, Exhibitor.self, Event.self)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(container)
                .task {
                    EventRepository.seedIfNeeded(context: container.mainContext)
                }
        }
    }
}

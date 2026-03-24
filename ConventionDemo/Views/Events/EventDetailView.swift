import SwiftUI

struct EventDetailView: View {
    let event: Event
    @Environment(\.modelContext) private var context

    var body: some View {
        let eventRepo = EventRepository(context: context)

        ZStack(alignment: .topLeading) {
            Color("bg-color").ignoresSafeArea()

            VStack(spacing: 16) {
                EventImage(eventCategory: event.category)

                Text(event.bio)

                ScheduleInfo(
                    location: event.location,
                    starttime: event.start,
                    endtime: event.end
                )
                .background(.thinMaterial)
                .opacity(0.9)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                
                // Only workshops can be signed up for
                if(event.category == Category.workshop){
                    CheckInButton(event: event, repository: eventRepo)
                }
            }
            .padding(16)
        }
        .navigationTitle(event.name)
    }
}

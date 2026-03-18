import SwiftUI

struct EventDetailView: View {
    let event: Event?
    
    var body: some View {
        ZStack(alignment: .topLeading) {
        Color("bg-color").ignoresSafeArea()
            VStack(spacing: 16){
                if let event = event {
                    EventImage(eventCategory: event.category)
                    
                    Text(event.description)
                    
                    ScheduleInfo(location: event.location, starttime: event.start, endtime: event.end)
                        .background(.thinMaterial)
                        .opacity(0.9)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    CheckInButton(event: event)
                        
                } else {
                    Text("Loading...")
                }
            }
            .padding(16)
        }.navigationTitle(event?.name ?? "Event")
    }
}

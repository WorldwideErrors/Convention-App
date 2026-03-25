import SwiftUI

struct ScheduleCard: View {
    let event: Event

    var body: some View {
        NavigationLink(destination: EventDetailView(event: event)){
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(event.name)
                        .font(.headline)
                        .foregroundStyle(Color("text-color"))
                    
                    Text("\(event.start.formatted(date: .omitted, time: .shortened)) - \(event.end.formatted(date: .omitted, time: .shortened))")
                        .font(.caption)
                        .foregroundStyle(Color("text-color").opacity(0.9))
                }
                
                Spacer()
                
                FavButton(event: event)
            }
            .padding()
            .background(.thinMaterial.opacity(0.9))
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

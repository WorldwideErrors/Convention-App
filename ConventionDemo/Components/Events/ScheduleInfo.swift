import SwiftUI

struct ScheduleInfo: View {
    let location: Location
    let starttime: Date
    let endtime: Date
    
    private var startDateString: String {
        starttime.formatted(date: .abbreviated, time: .omitted)
    }
    
    private var timeString: String{
        starttime.formatted(date: .omitted, time: .shortened) + " - " + endtime.formatted(date: .omitted, time: .shortened)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 8) {
                Image(systemName: "calendar")
                    .frame(width: 20)
                Text(startDateString + ", " + timeString)
            }

            HStack(spacing: 8) {
                Image(systemName: "building")
                    .frame(width: 20)
                Text(location.name + ", " + location.area.name)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(8)
    }
}

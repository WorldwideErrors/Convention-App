import SwiftUI
import SwiftData

struct ScheduleView: View {
    @Environment(\.modelContext) private var context

    @State private var searchText = ""
    @State private var selectedDate: Date

    @Query(sort: [SortDescriptor(\Event.start, order: .forward)])
    private var events: [Event]

    init() {
        // Temporary placeholder; real default will be set in onAppear
        _selectedDate = State(initialValue: Date())
    }

    private var filteredEvents: [Event] {
        events
            .filter {
                Calendar.current.isDate($0.start, inSameDayAs: selectedDate)
            }
            .filter {
                searchText.isEmpty ||
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
    }

    private var availableDates: [Date] {
        let uniqueDates = Set(events.map { Calendar.current.startOfDay(for: $0.start) })
        return uniqueDates.sorted()
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color("bg-color").ignoresSafeArea()

                ScrollView {
                    Picker("Select a date", selection: $selectedDate) {
                        ForEach(availableDates, id: \.self) { date in
                            Text(
                                date.formatted(
                                    .dateTime
                                        .month(.abbreviated)
                                        .day()
                                        .weekday(.abbreviated)
                                )
                            )
                            .font(.largeTitle)
                            .tag(date)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.vertical, 16)
                    .onAppear {
                        if let firstDate = availableDates.first {
                            selectedDate = firstDate
                        }
                    }

                    LazyVStack(spacing: 16) {
                        ForEach(filteredEvents, id: \.id) { event in
                            ScheduleCard(event: event)
                        }
                    }
                }
                .padding(.horizontal, 16)
                .navigationTitle("Schedule")
                .navigationBarBackButtonHidden(true)
                .searchable(
                    text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Search event"
                )
                .toolbarTitleDisplayMode(.inline)
            }
        }
    }
}

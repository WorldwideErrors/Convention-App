import SwiftUI

struct GuestsView: View {
    @State private var searchText = ""
    
    private let guests = GuestRepository.loadGuests()
    
    private var searchResults : [Guest] {
        searchText.isEmpty ? guests : guests.filter { $0.name.localizedCaseInsensitiveContains(searchText) || $0.role.localizedCaseInsensitiveContains(searchText)}
    }
    
    private let columns = [
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16)
        ]
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color("bg-color").ignoresSafeArea()
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(searchResults, id: \.id) { guest in
                            GuestItem(guest: guest)
                                .frame(maxWidth: .infinity)
                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        }
                    }
                }
                .padding(.horizontal, 16)
                .navigationBarBackButtonHidden(true)
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search guest")
                .toolbarTitleDisplayMode(.inline)
            }
        }
    }
}

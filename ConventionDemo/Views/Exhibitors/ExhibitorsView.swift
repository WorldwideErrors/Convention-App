import SwiftUI
import SwiftData

struct ExhibitorsView: View {
    @Environment(\.modelContext) private var context
    
    @State private var searchText = ""
    
    @Query private var exhibitors: [Exhibitor]
    
    private var searchResults : [Exhibitor] {
        searchText.isEmpty ? exhibitors : exhibitors.filter { $0.name.localizedCaseInsensitiveContains(searchText)}
    }
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color("bg-color").ignoresSafeArea()
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(searchResults, id: \.id) { exhibitor in
                            ExhibitorItem(exhibitor: exhibitor)
                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        }
                    }
                    
                }.padding(.horizontal, 16)
                .navigationBarBackButtonHidden(true)
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search exhibitor")
                .toolbarTitleDisplayMode(.inline)
            }
        }
        .task {
            print("TASK IS RUNNING")
            ExhibitorRepository.seedIfNeeded(context: context)
        }
    }
}

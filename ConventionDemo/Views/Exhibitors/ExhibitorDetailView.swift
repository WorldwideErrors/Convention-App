import SwiftUI
import SwiftData

struct ExhibitorDetailView: View {
    let id: Int
        
    @Query private var exhibitors: [Exhibitor]
    
    private var exhibitor: Exhibitor? {
        exhibitors.first
    }
    
    init(id: Int) {
        self.id = id
        
        _exhibitors = Query(filter: #Predicate<Exhibitor> { $0.id == id })
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
        Color("bg-color").ignoresSafeArea()
            VStack(spacing: 16){
                if let exhibitor = exhibitor {
                    ExhibitorDetail(exhibitor: exhibitor)
                } else {
                    Text("Loading...")
                }
            }
            .navigationTitle(exhibitor?.name ?? "Exhibitor")
            .padding(16)
        }
    }
}


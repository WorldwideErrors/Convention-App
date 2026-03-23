import SwiftUI
import SwiftData

struct GuestDetailView: View {
    let id: Int
        
    @Query private var guests: [Guest]
    
    private var guest: Guest? {
        guests.first
    }
    
    init(id: Int) {
        self.id = id
        
        _guests = Query(filter: #Predicate<Guest> { $0.id == id })
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
        Color("bg-color").ignoresSafeArea()
            VStack {
                if let guest = guest {
                    GuestDetail(guest: guest)
                } else {
                    Text("Loading...")
                }
            }
        }
    }
}

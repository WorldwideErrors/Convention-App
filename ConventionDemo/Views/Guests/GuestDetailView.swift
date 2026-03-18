import SwiftUI

struct GuestDetailView: View {
    let id: Int
        
    private var guest: Guest? {
        GuestRepository.getGuest(withId: id)
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

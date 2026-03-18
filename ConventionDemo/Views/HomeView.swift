import SwiftUI

struct HomeView: View {
    @Binding var selectedTab: Int
    var body: some View {
        NavigationStack {
            ZStack {
                Image("bg-comic")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack(spacing: 16) {
                    NavigationMap(action: { selectedTab = 2})
                    
                    Button {
                        selectedTab = 1
                    } label: {
                        NavigationButton(title: "Schedule", icon: "calendar")
                    }
                    
                    NavigationButton(
                        title: "Guests",
                        icon: "star.fill",
                        destination: GuestsView()
                    )
                    
                    NavigationButton(
                        title: "Exhibitors",
                        icon: "storefront.fill",
                        destination: ExhibitorsView()
                    )
                    
                    NavigationButton(
                        title: "Meet & Greets",
                        icon: "message.fill",
                        destination: GuestsView()
                    )
                }
                .frame(maxWidth: .infinity)
                .padding(16)
            }
        }
    }
}

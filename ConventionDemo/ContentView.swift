import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {

        TabView(selection: $selectedTab){
            
            // Home
            NavigationStack{
                HomeView(selectedTab: $selectedTab)
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            .tag(0)
            
            // Schedule
            NavigationStack{
                ScheduleView()
            }
            .tabItem {
                Label("Schedule", systemImage: "calendar")
            }
            .tag(1)

            // Maps
            NavigationStack{
                MapView()
            }
            .tabItem {
                Label("Maps", systemImage: "map.fill")
            }
            .tag(2)
            
            // Info
            NavigationStack{
                ScanView()
            }
            .tabItem {
                Label("Join Activity", systemImage: "qrcode.viewfinder")
            }
            .tag(3)
        }
    }
}

#Preview {
    ContentView()
}

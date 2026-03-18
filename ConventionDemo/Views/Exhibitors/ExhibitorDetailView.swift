import SwiftUI

struct ExhibitorDetailView: View {
    let id: Int
        
    private var exhibitor: Exhibitor? {
        ExhibitorRepository.getExhibitor(withId: id)
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


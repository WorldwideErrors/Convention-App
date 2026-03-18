import SwiftUI

struct ExhibitorItem: View {
    let exhibitor: Exhibitor
    
    var body: some View {
        // Navigation to guest information
        NavigationLink(destination: ExhibitorDetailView(id: exhibitor.id)){
            //Exhibitor Image
            ExhibitorIcon(exhibitorIcon: exhibitor.image ?? "photo.circle.fill")
            // Guest name
            Text(exhibitor.name)
                .font(.headline)
                .foregroundStyle(Color("text-color"))
                .padding(8)
                .frame(maxWidth: .infinity, alignment: .leading)
        }.clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .padding(8)
        .background(.thinMaterial.opacity(0.9))
            
    }
}

import SwiftUI

struct ExhibitorDetail: View {
    let exhibitor: Exhibitor
    
    var body: some View {
        
        ExhibitorImage(exhibitorIcon: exhibitor.image ?? "photo.circle.fill")
            .padding(8)
            .background(.thinMaterial.opacity(0.9))
            .frame(maxWidth:.infinity)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        Text(exhibitor.bio)
    }
}

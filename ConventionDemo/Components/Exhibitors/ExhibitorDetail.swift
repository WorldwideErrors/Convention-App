import SwiftUI

struct ExhibitorDetail: View {
    @Environment(\.openURL) var openURL
    
    let exhibitor: Exhibitor
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            ExhibitorImage(exhibitorIcon: exhibitor.image ?? "photo.circle.fill")
                .padding(8)
                .background(.thinMaterial.opacity(0.9))
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            
            Text(exhibitor.bio)
            
            HStack{
                Spacer()
                Text(exhibitor.location.name + ", " + exhibitor.location.area.name)
                    .padding(8)
                    .background(.thinMaterial.opacity(0.9))
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
            
            
            
            if let urlString = exhibitor.url,
               let url = URL(string: urlString) {
                
                Spacer()
                Button {
                    openURL(url)
                } label: {
                    Label("Visit Website", systemImage: "globe")
                }
                .padding(16)
                .frame(maxWidth: .infinity)
                .background(.thinMaterial.opacity(0.9))
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
        }
        .padding()
    }
}

import SwiftUI

struct GuestDetail: View {
    let guest: Guest
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Guest Image from URL
            AsyncImage(url: URL(string: guest.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 220)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .shadow(color: .black.opacity(0.5), radius: 40)
            } placeholder: {
                Image(systemName: "person.crop.square")
                    .resizable()
                    .scaledToFit()
                    .padding(40)
                    .frame(height: 250)
                    .frame(maxWidth: .infinity)
            }
            
            // Stack with guest information
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text(guest.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text(guest.role)
                        .font(.subheadline)
                }
                
                Text(guest.bio)
            }
            .padding(16) // inner padding for text
            .background(.thinMaterial)
            .opacity(0.9)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal, 16) // ← space from screen edges
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea()
    }
}

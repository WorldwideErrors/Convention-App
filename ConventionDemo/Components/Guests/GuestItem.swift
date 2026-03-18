import SwiftUI

struct GuestItem: View {
    let guest: Guest
    
    var body: some View {
        // Navigation to guest information
        NavigationLink(destination: GuestDetailView(id: guest.id)){
            ZStack(alignment: .bottomLeading) {
                
                //Card image from url
                AsyncImage(url: URL(string: guest.image)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Image(systemName: "person.crop.square")
                        .resizable()
                        .scaledToFit()
                        .padding(30)
                        .foregroundStyle(Color("text-color"))
                }
                .frame(width: 180, height: 165)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                
                // Guest name
                Text(guest.name)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.black.opacity(0.9))
            }
            .frame(width: 180)
        }
    }
}

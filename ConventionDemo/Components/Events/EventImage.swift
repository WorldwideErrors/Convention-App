import SwiftUI

struct EventImage: View {
    let eventCategory: Category
     
    var body: some View {
        ZStack {
            
            Image(eventCategory.rawValue)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .aspectRatio(16/9, contentMode: .fit)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            
        }.padding(8)
        .frame(maxWidth: .infinity)
        .background(.thinMaterial.opacity(0.9))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

import SwiftUI

struct NavigationMap: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Image("mapping")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .aspectRatio(16/9, contentMode: .fit)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                

                Image(systemName: "map.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 56, height: 56)
                    .padding(12)
            }
            .padding(8)
            .frame(maxWidth: .infinity)
            .background(.thinMaterial.opacity(0.9))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .foregroundStyle(Color("text-color"))
        }
    }
}

import SwiftUI

struct NavigationButton<Destination: View>: View {
    let title: String
    let icon: String
    let destination: Destination?
    
    // Navigation initializer
    init(title: String, icon: String, destination: Destination) {
        self.title = title
        self.icon = icon
        self.destination = destination
    }
    
    // Action initializer
    init(title: String, icon: String) where Destination == EmptyView {
        self.title = title
        self.icon = icon
        self.destination = nil
    }
    
    var body: some View {
        Group {
            if let destination = destination {
                NavigationLink(destination: destination) {
                    content
                }
            } else {
                content
            }
        }
    }
    
    private var content: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .frame(width: 24)
            
            Text(title)
                .font(.headline)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.footnote.weight(.semibold))
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity)
        .background(.thinMaterial.opacity(0.9))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .foregroundStyle(Color("text-color"))
    }
}

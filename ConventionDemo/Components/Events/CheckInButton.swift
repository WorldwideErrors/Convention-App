import SwiftUI

struct CheckInButton: View {
    @State private var checkedIn: Bool = false
    
    let event: Event
     
    var body: some View {
        Button(action:{
            checkedIn.toggle()
        }){
            HStack(spacing: 8) {
                Image(systemName: checkedIn ? "arrow.left.circle.fill" : "arrow.right.circle.fill")
                Text(checkedIn ? "CHECK OUT" : "CHECK IN")
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity)
            .background(.thinMaterial.opacity(0.9))
            .foregroundStyle(Color("text-color"))
            .background(
                checkedIn
                ? Color.red.opacity(0.2)
                : Color.green.opacity(0.2)
            )
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
        .animation(.easeInOut(duration: 0.2), value: checkedIn)
    }
}

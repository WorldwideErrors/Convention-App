import SwiftUI

struct FavButton: View{
    let event: Event
    
    @State var isFav: Bool = false
    
    var body: some View{
        Button(action: {
            self.isFav.toggle()
        }){
            if isFav{
                Image(systemName: "heart.fill")
            }else{
                Image(systemName: "heart")
            }
        }
        .foregroundStyle(.pink)
        .frame(width: 48, height: 48)
    }
}

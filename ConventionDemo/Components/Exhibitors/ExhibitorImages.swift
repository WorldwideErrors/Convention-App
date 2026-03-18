import SwiftUI

struct ExhibitorIcon: View {
    let exhibitorIcon: String
    
    var body: some View {
        AsyncImage(url: URL(string: exhibitorIcon)) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            Image(systemName: "photo.circle.fill")
                .resizable()
                .scaledToFit()
        }
        .frame(width: 64, height: 64)
        .clipShape(Circle())
    }
}

struct ExhibitorImage: View {
    let exhibitorIcon: String

    var body: some View {
        AsyncImage(url: URL(string: exhibitorIcon)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            case .failure(_):
                placeholder
            case .empty:
                placeholder
            @unknown default:
                placeholder
            }
        }
    }

    private var placeholder: some View {
        Image(systemName: "photo.circle.fill")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity, maxHeight: 200)
            .padding(40)
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

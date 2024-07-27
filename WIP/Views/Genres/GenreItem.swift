import SwiftUI

struct GenreItem: View {
    var book: Book
    
    var body: some View {
        VStack(alignment: .leading) {
            book.image
                .renderingMode(.original)
                .resizable()
                .scaledToFill()
                .frame(width: 155, height: 155)
                .clipped()
                .cornerRadius(5)
            HStack {
                Text(book.title)
                    .foregroundStyle(.primary)
                    .font(.caption)
                Image(systemName: book.isFinished ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(book.isFinished ? .green : .gray)
                Image(systemName: book.isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(book.isFavorite ? .pink : .gray)
                Spacer()
            }
            .frame(maxWidth: 150)

        }
        .padding(.leading, 15)
    }
}

#Preview {
    GenreItem(book: ModelData().books[0])
}

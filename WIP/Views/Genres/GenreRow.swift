import SwiftUI

struct GenreRow: View {
    var genreName: String
    var items: [Book]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(genreName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { book in
                        NavigationLink {
                            BookDetail(book: book)
                        } label: {
                            GenreItem(book: book)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    let books = ModelData().books
    return GenreRow(
        genreName: books[0].genre.rawValue,
        items: Array(books.prefix(4))
    )
}

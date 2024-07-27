import SwiftUI

struct BookRow: View {
    @Environment(ModelData.self) var modelData
    
    var book: Book
    var bookIndex: Int {
        modelData.books.firstIndex(where: { $0.id == book.id })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        HStack {
            book.image
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipped()
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.headline)
                Text(book.author)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            HStack(alignment: .firstTextBaseline) {
                FinishedButton(isSet: $modelData.books[bookIndex].isFinished)
                LikedButton(isSet: $modelData.books[bookIndex].isFavorite)
            }
        }
        .contextMenu {
            Text(book.summary)
            /* Button("Effacer livre", role: .destructive) {
                deleteItem(book)
            }
             à la place, il y aura une fonction pour modifier la fiche du livre, avec l'icône "pen"
            */
        }
        .swipeActions {
            Button(role: .destructive) {
                deleteItem(book)
            } label: {
                Label("Effacer", systemImage: "trash")
            }
        }
    }
    
    func deleteItem(_ item: Book) {
        if let index = modelData.books.firstIndex(of: item) {
            modelData.books.remove(at: index)
        }
    }
}

//#Preview {
//    let books = ModelData().books
//    return Group {
//        BookRow(book: ModelData().books[0])
//        BookRow(book: ModelData().books[1])
//    }
//}

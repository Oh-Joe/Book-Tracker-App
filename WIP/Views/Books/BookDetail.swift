import SwiftUI

struct BookDetail: View {
    @Environment(ModelData.self) var modelData
    var book: Book
    
    var bookIndex: Int {
        modelData.books.firstIndex(where: { $0.id == book.id })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            Image("bookshelf1")
                .resizable()
                .scaledToFill()
                .frame(height: 300)
                .clipped()
            
            CircleImage(image: book.image)
                .offset(y: -230)
                .padding(.bottom, -220)
            
            VStack(alignment: .leading) {
                HStack(alignment: .firstTextBaseline) {
                    Text(book.title)
                        .font(.title)
                    FinishedButton(isSet: $modelData.books[bookIndex].isFinished)
                    LikedButton(isSet: $modelData.books[bookIndex].isFavorite)
                }
                
                HStack {
                    Text(book.author)
                    Spacer()
                    Text(book.genre.rawValue)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("Résumé")
                    .font(.title2)
                Text(book.summary)
            }
            .padding()
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    return BookDetail(book: modelData.books[0])
        .environment(modelData)
}

import SwiftUI

struct BookList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFinishedOnly = false
    @State private var isPresentingForm = false
    
    var filteredBooks: [Book] {
        modelData.books.filter { book in
            (!showFinishedOnly || book.isFinished)
        }
    }
    var body: some View {
        NavigationSplitView {
            
            Toggle(isOn: $showFinishedOnly) {
                Text("Livres finis uniquement")
            }
            .padding(.horizontal, 20)
            List {
                ForEach(filteredBooks) { book in
                    NavigationLink {
                        BookDetail(book: book)
                    } label: {
                        BookRow(book: book)
                    }
                }
            }
            .animation(.default, value: filteredBooks)
            .listStyle(.inset)
            .navigationTitle("Ma Bibliothèque")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        isPresentingForm.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $isPresentingForm) {
                        AddBook()
                    }
                }
            }
        } detail: {
            Text("Choisis un livre")
        }
    }
}

#Preview {
    BookList()
        .environment(ModelData())
}

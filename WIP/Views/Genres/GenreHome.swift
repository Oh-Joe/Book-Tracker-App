import SwiftUI

struct GenreHome: View {
    @Environment(ModelData.self) var modelData
    @State private var isPresentingForm = false
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(modelData.genres.keys.sorted(), id: \.self) { key in
                    GenreRow(genreName: key, items: modelData.genres[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Genres")
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
    GenreHome()
        .environment(ModelData())
}

import SwiftUI

struct ContentView: View {
    @State private var isPresentingForm = false
    var body: some View {
        TabView() {
            BookList()
                .tabItem {
                    Label("Bibliothèque", systemImage: "books.vertical")
                }
                
            GenreHome()
                .tabItem {
                    Label("Genres", systemImage: "theatermasks")
                }
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}

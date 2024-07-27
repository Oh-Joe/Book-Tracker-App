import SwiftUI

struct draft_ContentView: View {
    @State private var isPresentingForm = false

    @State private var selection: Tab = .library
    
    enum Tab {
        case library
        case genres
    }
    
    var body: some View {
    TabView(selection: $selection) {
        BookList()
            .tabItem {
                Label("Bibliothèque", systemImage: "books.vertical")
            }
            .tag(Tab.library)
        
        GenreHome()
            .tabItem {
                Label("Genres", systemImage: "theatermasks")
            }
            .tag(Tab.genres)
        }
    }
}

#Preview {
    draft_ContentView()
        .environment(ModelData())
}

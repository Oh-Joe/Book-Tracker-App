import Foundation

@available(iOS 13.0, *)
@Observable
class ModelData: ObservableObject {
    var books: [Book] = load("bookData.json")
    

    
    var genres: [String: [Book]] {
        Dictionary(
            grouping: books,
            by: { $0.genre.rawValue }
        )
    }
    
    func removeBook(at offsets: IndexSet) {
        books.remove(atOffsets: offsets)
    }
    
    func saveBook() {
        let filename = "bookData.json"
        let url = getDocumentsDirectory().appendingPathComponent(filename)
        
        do {
            let data = try JSONEncoder().encode(books)
            try data.write(to: url)
        } catch {
            fatalError("Couldn't save books to \(filename): \(error)")
        }
    }
    
    func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

import SwiftUI
import PhotosUI

struct NewBook: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var id = 0
    @State private var title = ""
    @State private var author = ""
    @State private var genre: Book.Genre = .fiction
    @State private var isFavorite = false
    @State private var isFinished = false
    @State private var summary = ""
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    @State private var isCameraPresented = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Détails")) {
                    TextField("Titre", text: $title)
                    TextField("Auteur", text: $author)
                    Picker("Genre :", selection: $genre) {
                        ForEach(Book.Genre.allCases, id: \.self) { genre in
                            Text(genre.rawValue).tag(genre)
                        }
                    }
                    
                    Toggle("Favori", isOn: $isFavorite)
                    Toggle("Fini", isOn: $isFinished)
                    TextField("Résumé", text: $summary)
                        .frame(height: 80, alignment: .top)
                }
                
                Section(header: Text("Couverture")) {
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                    }
                    Button("Choisir parmi mes photos") {
                        isImagePickerPresented = true
                    }
                    Button("Prendre photo") {
                        isCameraPresented = true
                    }
                }
            }
            
            .navigationTitle("Ajouter un livre")
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Enregistrer") {
                        addBook()
                    }
                }
            }
            .padding(.top, 0)
            
        
        }
//        .sheet(isPresented: $isImagePickerPresented) {
//            ImagePicker(sourceType: .photoLibrary, selectedImage: $selectedImage)
//        }
//        .sheet(isPresented: $isCameraPresented) {
//            ImagePicker(sourceType: .camera, selectedImage: $selectedImage)
//        }
    }
    
    func addBook() {
        guard let selectedImage = selectedImage else { return }
        
        // Save image to the app's directory and get the image name
        let imageName = UUID().uuidString
        saveImage(selectedImage, with: imageName)
        
        // Create a new book
        let newBook = Book(
            id: modelData.books.count + 1, // Assuming you want to generate a new ID
            title: title,
            author: author,
            summary: summary,
            isFinished: isFinished,
            isFavorite: isFavorite,
            genre: genre,
            imageName: imageName
        )
        
        // Update the model data
        modelData.books.append(newBook)
        modelData.saveBook()
    }
    
    func saveImage(_ image: UIImage, with name: String) {
        if let data = image.jpegData(compressionQuality: 0.8) {
            let url = getDocumentsDirectory().appendingPathComponent("\(name).jpg")
            try? data.write(to: url)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
}

#Preview {
    NewBook()
        .environment(ModelData())
}

import SwiftUI

struct draft_AddBook: View {

    @Environment(ModelData.self) var modelData
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var author = ""
    @State private var summary = ""
    @State private var isFinished = false
    @State private var isFavorite = false
    @State private var genre = Book.Genre.fiction
    @State private var image: UIImage?
    @State private var showingImagePicker = false
    @State private var showingImageSourcePicker = false
    @State private var imageSource: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Détails")) {
                    TextField("Titre", text: $title)
                    TextField("Auteur", text: $author)
                    TextField("Résumé", text: $summary)
                        .frame(height: 80, alignment: .top)
                    Picker("Genre", selection: $genre) {
                        ForEach(Book.Genre.allCases, id: \.self) { genre in
                            Text(genre.rawValue).tag(genre)
                        }
                    }
                    Toggle("Fini", isOn: $isFinished)
                    Toggle("Favori", isOn: $isFavorite)
                    
                }
                
                Section(header: Text("Couverture")) {
                    Button(action: {
                        showingImageSourcePicker = true
                    }) {
                        Text("Choisir une Image")
                    }
                    if let image = image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                    }
                }
                
            }
            
            .actionSheet(isPresented: $showingImageSourcePicker) {
                ActionSheet(
                    title: Text("Où choisir l'image de couverture ?"),
                    buttons: [
                        .default(Text("Mes photos")) {
                            imageSource = .photoLibrary
                            showingImagePicker = true
                        },
                        .default(Text("Prendre une photo")) {
                            imageSource = .camera
                            showingImagePicker = true
                        },
                        .cancel()
                    ]
                )
            }
            
            .navigationBarTitle("Ajouter un livre")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Enregistrer") {
                        saveBook()
                        
                    }
                }
            }
            
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $image, sourceType: imageSource)
            }
        }
    }
    
    func saveBook() {
        guard let image = image else { return }
        let imageName = UUID().uuidString
        saveImage(image: image, name: imageName)
        
        let newBook = Book(
            id: modelData.books.count + 1,
            title: title,
            author: author,
            summary: summary,
            isFinished: isFinished,
            isFavorite: isFavorite,
            genre: genre,
            imageName: imageName
        )
        
        modelData.books.append(newBook)
        modelData.saveBook()
    }
    
    func saveImage(image: UIImage, name: String) {
        if let data = image.jpegData(compressionQuality: 0.8) {
            let filename = getDocumentsDirectory().appendingPathComponent("\(name).jpg")
            try? data.write(to: filename)
        }
        presentationMode.wrappedValue.dismiss()
    }
    
    func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
}

#Preview {
    draft_AddBook()
        .environment(ModelData())
}

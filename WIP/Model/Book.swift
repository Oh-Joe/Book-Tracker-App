import Foundation
import SwiftUI
import UIKit

struct Book: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var author: String
    var summary: String
    var isFinished: Bool
    var isFavorite: Bool
    
    var genre: Genre
    enum Genre: String, CaseIterable, Codable {
        case action = "Action"
        case autobiography = "Autobiographie"
        case adventure = "Aventure"
        case biography = "Biographie"
        case comedy = "Comédie"
        case drama = "Drame"
        case dystopia = "Dystopie"
        case essay = "Essai"
        case fantasy = "Fantasy"
        case fiction = "Fiction"
        case history = "Histoire"
        case horror = "Horreur"
        case memoir = "Mémoires"
        case mystery = "Mystère"
        case philosphy = "Philosophie"
        case polar = "Polar"
        case psychology = "Psychologie"
        case romance = "Romance"
        case scienceTech = "Science & Technologie"
        case scienceFiction = "Science Fiction"
        case sport = "Sport"
        case theatre = "Théâtre"
        case thriller = "Thriller"
        case travel = "Voyages"
    }
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    init(id: Int, title: String, author: String, summary: String, isFinished: Bool, isFavorite: Bool, genre: Genre, imageName: String) {
        self.id = id
        self.title = title
        self.author = author
        self.summary = summary
        self.isFinished = isFinished
        self.isFavorite = isFavorite
        self.genre = genre
        self.imageName = imageName
    }
}



//struct Book: Hashable, Codable, Identifiable {
//    var id = UUID()
//    var title: String
//    var author: String
//    var cover: UIImage
//    var summary: String
//    var isFinished: Bool
//    var isFavorite: Int
//    var genre: Genre
//    enum Genre: String, CaseIterable, Codable {
//        case fiction = "Fiction"
//        case scienceFiction = "Science Fiction"
//        case biography = "Biographie"
//        case autobiography = "Autobiographie"
//        case scienceTech = "Science & Technologie"
//        case fantasy = "Fantasy"
//        case adventure = "Aventure"
//        case romance = "Romance"
//        case polar = "Polar"
//        case thriller = "Thriller"
//        case theatre = "Théâtre"
//        case philosphy = "Philosophie"
//        case comedy = "Comédie"
//    }
//    
//    enum CodingKeys: String, CodingKey {
//        case id, title, author, summary, isFinished, isFavorite, cover, genre
//    }
//
//    // Custom encoding and decoding for UIImage
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        id = try container.decode(UUID.self, forKey: .id)
//        title = try container.decode(String.self, forKey: .title)
//        author = try container.decode(String.self, forKey: .author)
//        summary = try container.decode(String.self, forKey: .summary)
//        isFinished = try container.decode(Bool.self, forKey: .isFinished)
//        isFavorite = try container.decode(Int.self, forKey: .isFavorite)
//        let coverData = try container.decode(Data.self, forKey: .cover)
//        cover = UIImage(data: coverData) ?? UIImage()
//        genre = try container.decode(Genre.self, forKey: .genre)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(title, forKey: .title)
//        try container.encode(author, forKey: .author)
//        try container.encode(summary, forKey: .summary)
//        try container.encode(isFinished, forKey: .isFinished)
//        try container.encode(isFavorite, forKey: .isFavorite)
//        let coverData = cover.pngData()
//        try container.encode(coverData, forKey: .cover)
//        try container.encode(genre, forKey: .cover)
//    }
//}

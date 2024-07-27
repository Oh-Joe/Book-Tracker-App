import SwiftUI

struct LikedButton: View {
    @Environment(ModelData.self) var modelData
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Favori", systemImage: isSet ? "heart.fill" : "heart")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .pink : .gray)
        }
    }
}

#Preview {
    LikedButton(isSet: .constant(true))
}

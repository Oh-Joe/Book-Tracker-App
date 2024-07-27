import SwiftUI

struct FinishedButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Livre fini", systemImage: isSet ? "checkmark.circle.fill" : "circle")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .green : .gray)
        }
    }
}

#Preview {
    FinishedButton(isSet: .constant(true))
}

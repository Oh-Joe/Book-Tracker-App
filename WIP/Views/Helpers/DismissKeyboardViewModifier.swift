import SwiftUI

struct DismissKeyboardViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.clear) // Ensure the background is tappable
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
    }
}

extension View {
    func dismissKeyboardOnTap() -> some View {
        self.modifier(DismissKeyboardViewModifier())
    }
}

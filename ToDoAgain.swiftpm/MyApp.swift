import SwiftUI

@main
struct MyApp: App {
    @StateObject private var model: ToDoViewModel
    init() {
        _model = StateObject(wrappedValue: ToDoViewModel())
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ItemView()
                Text("No items to display. Please press “Add” to add new items.")
                    .foregroundStyle(.secondary)
            }
            .navigationViewStyle(.stack)
            .environmentObject(model)
        }
    }
}

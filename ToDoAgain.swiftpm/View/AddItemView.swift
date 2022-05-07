import SwiftUI

struct AddItemView: View {
    @EnvironmentObject private var model: ToDoViewModel
    @Binding var isPresentingNewItemView: Bool
    var body: some View {
        NavigationView {
            DetailEditView(data: $model.newItemData)
                .navigationTitle(model.newItemData.title)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewItemView = false
                            model.resetItem()
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            withAnimation {
                                model.add()
                            }
                            isPresentingNewItemView = false
                        }
                        .disabled(model.newItemData.title.isEmpty)
                    }
                }
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(isPresentingNewItemView: .constant(true))
            .environmentObject(ToDoViewModel())
    }
}

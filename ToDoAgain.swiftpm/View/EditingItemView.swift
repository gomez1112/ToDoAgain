import SwiftUI

struct EditingItemView: View {
    @EnvironmentObject private var model: ToDoViewModel
    @Binding var isPresentingEditView: Bool
    @Binding var item: ToDoItem
    var body: some View {
        NavigationView {
            DetailEditView(data: $model.newItemData)
                .navigationTitle(item.title)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingEditView = false
                            model.resetItem()
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            isPresentingEditView = false
                            item.update(from: model.newItemData)
                            model.resetItem()
                        }
                        .disabled(model.newItemData.title.isEmpty)
                    }
                }
        }
    }
}

struct EditingItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditingItemView(isPresentingEditView: .constant(true), item: .constant(ToDoItem.example[0]))
            .environmentObject(ToDoViewModel())
    }
}

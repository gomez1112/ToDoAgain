import SwiftUI

struct DetailView: View {
    @EnvironmentObject private var model: ToDoViewModel
    @State private var isPresentingEditView = false
    @Binding var item: ToDoItem
    var body: some View {
        DetailListView(item: $item)
            .toolbar { 
                Button("Edit") {
                    isPresentingEditView = true
                    model.newItemData = item.data
                }
            }
            .sheet(isPresented: $isPresentingEditView) {
                EditingItemView(isPresentingEditView: $isPresentingEditView, item: $item)
            }
            .onDisappear {
            let newHistory = History(date: item.deadline, title: item.title, description: item.description, status: item.status)
            item.history.insert(newHistory, at: 0)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: .constant(ToDoItem.example[0]))
            .environmentObject(ToDoViewModel())
    }
}

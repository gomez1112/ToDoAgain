import SwiftUI

@MainActor
final class ToDoViewModel: ObservableObject {
    @Published var items = [ToDoItem]()
    @Published var newItemData = ToDoItem.Data()
    init() {
        load()
        //items = ToDoItem.example
    }
    func resetItem() {
        newItemData = ToDoItem.Data()
    }
    func save()  {
        Task {
            do {
                try await FileManager.encode(items, from: Constants.filename)
            } catch {
                print("Cannot save")
            }
        }
    }
    
    func load()  {
        Task {
            do {
                items = try await FileManager.decode([ToDoItem].self, from: Constants.filename)
            } catch {
                items = []
            }
        }
    }
    func add() {
        let newItem = ToDoItem(data: newItemData)
        items.append(newItem)
    }
    func delete (_ item: ToDoItem) {
        items.removeAll { $0.id == item.id }
    }
    func delete(_ item: Set<ToDoItem>) {
        items.removeAll(where: item.contains)
    }
    func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
    
    func addItemToComplete(_ selectedItems: Set<ToDoItem>) {
        _ = selectedItems.map { item in 
            let index = items.firstIndex(matching: item)
            items[index ?? 0].status = .completed
        }
    }
}

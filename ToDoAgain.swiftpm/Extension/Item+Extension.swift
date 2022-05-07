import Foundation

extension ToDoItem {
    /// Contains all editable properties of ToDoItem
    /// Assign default values to all properties
    struct Data {
        var title = ""
        var description = ""
        var deadline = Date()
        var status = Status.pending
    }
    /// Computed data property that returns Data with the ToDoItem property values
    var data: Data {
        Data(title: title, description: description, deadline: deadline, status: status)
    }
    mutating func update(from data: Data) {
        title = data.title
        description = data.description
        deadline = data.deadline
        status = data.status
    }
    
    init(data: Data) {
        id = UUID()
        title = data.title
        description = data.description
        deadline = data.deadline
        status = data.status
    }
}

extension ToDoItem {
    static let example = [ToDoItem(title: "First Item", description: "I love this item", deadline: Date.now, status: .pending), ToDoItem(title: "Second Item", description: "Not so much I love this item", deadline: .now, status: .pending), ToDoItem(title: "Third Item", description: "This one needs more work", deadline: .now, status: .overdue)]
}

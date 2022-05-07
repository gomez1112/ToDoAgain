import SwiftUI

struct ToDoItem: Codable,Identifiable, Equatable, Hashable {
    var id = UUID()
    var title: String
    var description: String
    var deadline = Date()
    var status: Status
    var history: [History] = []
}

enum Status: String, Codable, Identifiable, CaseIterable {
    case pending
    case completed
    case overdue
    
    var icon: String {
        switch self {
        case .completed:
            return "checkmark.square.fill"
        case .pending:
            return "person.crop.circle.badge.clock"
        case .overdue:
            return "clock.badge.exclamationmark.fill"
        }
    }
    var id: Self {
        self
    }
}

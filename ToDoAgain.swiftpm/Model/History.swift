import Foundation

struct History: Identifiable, Codable, Equatable, Hashable {
    var id: UUID = UUID()
    var date: Date = .now
    var title: String = ""
    var description: String = ""
    var status: Status = .pending
}

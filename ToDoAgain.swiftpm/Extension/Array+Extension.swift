import Foundation

extension Array where Element: Identifiable {
    // find the index of the first element matching the ID of the given item
    func firstIndex(matching item: Element) -> Int? {
        if let index = self.firstIndex(where: {item.id == $0.id}) {
            return index
        }
        return nil
    }
}

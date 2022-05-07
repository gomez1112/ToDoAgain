import SwiftUI

struct DetailListView: View {
    @Binding var item: ToDoItem
    var body: some View {
        List {
            Section(header: Text("Item Name")) {
                HStack {
                    Image(systemName: item.status.icon)
                    Text(item.title)
                    Text(item.deadline.formatted(date: .complete, time: .omitted))
                }
            }
            Section(header: Text("Description")) {
                Text(item.description)
            }
            Section(header: Text("History")) {
                if item.history.isEmpty {
                    Label("No items yet", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(item.history) { history in
                    HStack {
                        Image(systemName: history.status.icon)
                        Text(history.title)
                        Text(history.date.formatted())
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailListView_Previews: PreviewProvider {
    static var previews: some View {
        DetailListView(item: .constant(ToDoItem.example[0]))
    }
}

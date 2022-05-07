import SwiftUI

struct ToDoItemRowView: View {
    let item: ToDoItem
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: item.status.icon)
                    .symbolRenderingMode(.multicolor)
                    .foregroundColor(.buttercup)
                    .imageScale(.large)
                Text(item.title)
                    .font(.headline)
                Spacer()
                Text(item.deadline.formatted(date: .long, time: .shortened))
            }
        }
        
        .padding()
    }
}

struct ToDoItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemRowView(item: ToDoItem.example[0])
    }
}

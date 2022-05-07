import SwiftUI

struct DetailEditView: View {
    @Binding var data: ToDoItem.Data
    var body: some View {
        Form {
            Section(header: Text("Item Info")) {
                TextField("Title", text: $data.title)
                DatePicker("Deadline", selection: $data.deadline)
            }
            Section(header: Text("Item Description")) {
                TextEditor(text: $data.description)
            }
            Section(header: Text("Item Status")) {
                Picker("Select Status", selection: $data.status) { 
                    ForEach(Status.allCases) { status in
                        Text(status.rawValue)
                            .tag(status)
                    }
                }
                .pickerStyle(.segmented)
                HStack(spacing: 30) {
                    Spacer()
                    Image(systemName: "person.crop.circle.badge.clock")
                    Spacer()
                    Image(systemName: "checkmark.square.fill")
                    Spacer()
                    Image(systemName: "clock.badge.exclamationmark.fill")
                    Spacer()
                }
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(.accentColor)
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(ToDoItem.example[0].data))
    }
}

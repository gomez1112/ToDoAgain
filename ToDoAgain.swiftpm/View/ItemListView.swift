import SwiftUI

struct ItemListView: View {
    @EnvironmentObject private var model: ToDoViewModel
    @State private var isPresentingNewItemView = false
    @State var editMode = EditMode.inactive
    @State private var selectedItems = Set<ToDoItem>()
    
    var body: some View {
        List(selection: $selectedItems) {
            ForEach(Status.allCases) { status in
                Section(header: Text(status.rawValue.uppercased())) {
                    ForEach($model.items.filter { $0.status.wrappedValue == status }) { $item in
                        NavigationLink {
                            DetailView(item: $item)
                        } label: {
                            ToDoItemRowView(item: item)
                            
                        }
                        .tag(item)
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                withAnimation {
                                    model.delete(item)
                                }
                            }
                        }
                        
                    }
                    .onMove { indexSet, index in
                        model.move(from: indexSet, to: index)
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading, content: EditButton.init)
            ToolbarItem(placement: .principal) {
                if editMode == .active {
                    HStack {
                        Spacer()
                        Image(systemName: "contextualmenu.and.cursorarrow")
                            .symbolRenderingMode(.hierarchical)
                            .foregroundColor(.accentColor)
                            .contextMenu {
                                Button("Delete", role: .destructive) {
                                    withAnimation {
                                        model.delete(selectedItems)
                                    }
                                }
                                Button("Complete") {
                                    withAnimation {
                                        model.addItemToComplete(selectedItems)
                                    }
                                    
                                }
                            }
                            .disabled(selectedItems.isEmpty)
                    }
                }
            }
        }
        .environment(\.editMode, $editMode)
    }
}

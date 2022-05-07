import SwiftUI

struct ItemView: View {
    @EnvironmentObject private var model: ToDoViewModel
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewItemView = false
    
    var body: some View {
        ItemListView()
            .navigationTitle("ToDoAgain")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Spacer()
                        Button { 
                            isPresentingNewItemView = true
                            model.resetItem()
                        } label: { 
                            Image(systemName: "plus")
                        }
                        .accessibilityLabel("New Item")
                    }
                }
            }
            .onChange(of: scenePhase) { phase in
                if phase == .inactive {
                    model.save()
                }
            }
            .sheet(isPresented: $isPresentingNewItemView) {
                AddItemView(isPresentingNewItemView: $isPresentingNewItemView)
            }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            
            ItemView()
        }
            .environmentObject(ToDoViewModel())
    }
}

import SwiftUI
import shared

struct ContentView: View {
    let viewModel = NoteViewModel()
    
    init() {
        viewModel.fetchNotes()
    }

	var body: some View {
        VStack{
            List{
                ForEach(viewModel.notes,
                        id: \.self){
                    item in
                    NoteCard(note: item)
                }
            }
        }
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

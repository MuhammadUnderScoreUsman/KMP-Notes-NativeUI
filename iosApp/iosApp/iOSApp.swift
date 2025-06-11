import SwiftUI
import shared

@main
struct iOSApp: App {
    
    private var noteRepository : NoteRepository
    private var viewModel: NoteViewModel
    
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    
    
    init() {
        self.noteRepository = NoteRepository(sqlDelightFactory: SqlDelightFactory())
        self.viewModel = NoteViewModel(noteRepository: noteRepository)
        print("Documents Directory: \(paths[0])")
    }
    
    
	var body: some Scene {
		WindowGroup {
            NoteListScreen().environmentObject(self.viewModel)
		}
	}
}

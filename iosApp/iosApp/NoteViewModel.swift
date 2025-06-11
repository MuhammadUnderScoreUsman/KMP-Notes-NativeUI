//
//  NoteViewModel.swift
//  iosApp
//
//  Created by Muhammad Usman on 15/05/2025.
//  Copyright © 2025 orgName. All rights reserved.
//

import Foundation
import shared

@MainActor
class NoteViewModel: ObservableObject {

    @Published var notes : [TodoEntity] = []
    @Published var note : TodoEntity?
    
    @Published var searchQuery : String = "" {
        didSet {
            fetchNotes()
        }
    }

    private var noteRepository: NoteRepository? = nil

    init(noteRepository: NoteRepository? = nil) {
        self.noteRepository = noteRepository
    }
    
    func setNote(note: TodoEntity?) {
        self.note = note
    }
    
    func insertNote(
        id: Int64? = nil,
        title: String,
        body: String,
        isImportant: Bool,
        selectedColor: String,
        onSaved : @escaping () -> Void
    ){
        noteRepository?.insertNotes(todoEntity:
                                        TodoEntity(id: id, title: title, body: body, isImportant: isImportant.toKtBool(),
                                                color: selectedColor)
                                   , completionHandler: {error in
            onSaved()
        })
    
    }


    func fetchNotes() {
        noteRepository?.searchNotes(query: searchQuery, completionHandler: { note, error in
            note?.forEach {
                item in
                print("todo: \(item.id)")
            }
            self.notes = note ?? []
            
        })
    }
    
    
    func deleteAllNotes(){
        noteRepository?.deleteAllNotes(completionHandler: {_ in })
    }
    
    func deleteNote(id: Int64, onDelete: @escaping () -> Void) {
        noteRepository?.deleteNote(id: id, completionHandler: { _ in
            onDelete()
        })
    }
    
    func pinUnpinNote(note: TodoEntity){
        noteRepository?.pinUnpinNote(todoEntity: note, completionHandler: { _ in
            
        })
    }
    
    

}

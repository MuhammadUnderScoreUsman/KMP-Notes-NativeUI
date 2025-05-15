//
//  NoteViewModel.swift
//  iosApp
//
//  Created by Muhammad Usman on 15/05/2025.
//  Copyright © 2025 orgName. All rights reserved.
//

import Foundation
import shared

class NoteViewModel {
    
    @Published var notes : [Note] = []
    
    func fetchNotes() {
        let notes = NoteSource().notes()
        self.notes = notes
    }
}

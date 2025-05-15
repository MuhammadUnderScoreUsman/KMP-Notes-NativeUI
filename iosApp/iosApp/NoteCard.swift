//
//  NoteCard.swift
//  iosApp
//
//  Created by Muhammad Usman on 15/05/2025.
//  Copyright © 2025 orgName. All rights reserved.
//

import SwiftUI
import shared

struct NoteCard: View {
    @State var note: Note
    var body: some View {
        Section{
            Text(note.title)
            ExpandableTextView(text: note.description_, isExpanded: false)
        }
    }
}

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

    @State var note: TodoEntity
    var onEdit: (TodoEntity) -> Void
    var onDelete: (Int64) -> Void
    var onChangeColor: (Int64) -> Void
    var pinUnPinNotes: (TodoEntity) -> Void
    


    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if(note.isImportant ?? false) as! Bool {
                    Image(systemName: "pin").foregroundColor(.blue)
                }
                Spacer()
                    Menu {
                        Button( action: {onEdit(note)}){
                            Label("Edit", systemImage: "square.and.pencil")
                        }
                        Button(action: {onChangeColor(note.id as! Int64)}){
                            Label("Change color", systemImage: "paintpalette")
                        }

                        Button(action: {onDelete(note.id as! Int64)}){
                            Label("Delete", systemImage: "trash")
                        }
                        Button(action: {pinUnPinNotes(note)}){
                            Label((note.isImportant ?? false) as! Bool ? "Unpin note" : "Pin Note", systemImage: (note.isImportant ?? false) as! Bool ? "pin.slash" : "pin")
                        }
                    } label : {
                        Image(systemName: "ellipsis").rotationEffect(.degrees(-90)).padding(4)
                    }
            }
            
            Text(note.title).font(.title3.bold())
            ExpandableTextView(text: note.body, isExpanded: false)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 16).fill(note.color.colorFromHex())
            .shadow(color: Color.black.opacity(0.3), radius: 2, x: 3, y: 3))
       
    }
    
}


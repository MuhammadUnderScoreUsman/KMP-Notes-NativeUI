//
//  UpsertNoteScreen.swift
//  iosApp
//
//  Created by Muhammad Usman on 20/05/2025.
//  Copyright © 2025 orgName. All rights reserved.
//

import SwiftUI

struct UpsertNoteScreen: View {

    @State private var title = ""
    @State private var description = ""
    @State private var showAlert = false
    @State private var isImportant = false
    @State private var bgColor = Color.green
    @State private var selectedColor = ""
    @State private var noteId: Int64? = nil

    @Environment(\.dismiss) var dismiss

    @EnvironmentObject var noteViewModel: NoteViewModel

    var body: some View {
        VStack(alignment: .center) {

            TextField("Note Title", text: $title)
                           .font(.title3.bold())
                           .padding()
                           .background(
                               RoundedRectangle(cornerRadius: 16)
                                   .fill(bgColor)
                           )
                           .submitLabel(.next)

            TextEditor(text: $description)
                         .scrollContentBackground(.hidden)
                         .font(.body)
                         .padding()
                         .background(
                             RoundedRectangle(cornerRadius: 16)
                                 .fill(bgColor)
                         )
                         .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)

            Button {
                guard !title.isEmpty || !description.isEmpty else {
                    showAlert = true
                    return
                }
                self.noteViewModel.insertNote(id: noteId, title: title, body: description,
                isImportant: isImportant, selectedColor: selectedColor){
                    dismiss()
                }
            } label: {
                Text("Save Note")
            }.padding(.top, 10)
                .padding(.bottom, 10)
                .padding(.leading, 32)
                .padding(.trailing,32)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(30)
        }.alert("Empty Field", isPresented: $showAlert){
            Button("Ok", role: .cancel){}
        } message :{
            Text("Fields can not be empty.")
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {} label : {
                    Image(systemName: "pin.fill")
                        .foregroundColor(isImportant ? .blue : .gray)
                        .onTapGesture {
                            isImportant = !isImportant
                        }
                }
                
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                ColorPicker("", selection: $bgColor).onChange(of: bgColor, perform: { value in
                    selectedColor = value.toHex()
                })
            }
        }
        .onAppear {
            title = noteViewModel.note?.title ?? ""
            description = noteViewModel.note?.body ?? ""
            isImportant = (noteViewModel.note?.isImportant ?? false) as! Bool
            selectedColor = noteViewModel.note?.color ?? ""
            bgColor = noteViewModel.note?.color.colorFromHex() ?? Color.blue.opacity(0.4)
            noteId = noteViewModel.note?.id ?? 0
        }
        .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
            
        Spacer()
    }
}


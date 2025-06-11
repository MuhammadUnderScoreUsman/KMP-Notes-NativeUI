//
//  NoteListScreen.swift
//  iosApp
//
//  Created by Muhammad Usman on 20/05/2025.
//  Copyright © 2025 orgName. All rights reserved.
//

import SwiftUI

struct NoteListScreen: View {

    @State private var path = NavigationPath()

    @EnvironmentObject private var viewModel: NoteViewModel

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    
    @State private var bgColor = Color.green
    
    enum Route : Hashable {
        case UpsertScreen
    }

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                StaggeredGridLayout(columns: 2, spacing: 16){
                    ForEach(viewModel.notes, id: \.self) {
                        item in
                        NoteCard(note: item, onEdit: {
                            note in
                            viewModel.setNote(note: item)
                            path.append(Route.UpsertScreen)
                        }, onDelete: {
                            id in
                            viewModel.deleteNote(id: id) {
                                print("NoteDelete \(id)")
                                viewModel.fetchNotes()
                            }
                        }, onChangeColor: {
                            id in
                            print(id)
                            ColorPicker("", selection: $bgColor).onChange(of: bgColor, perform: { value in
                                
                            })
                        }, pinUnPinNotes: {
                            note in
                            viewModel.pinUnpinNote(note: note)
                            viewModel.fetchNotes()
                        })
                    }
                }.onAppear {
                    viewModel.fetchNotes()
                }
            }.padding()
            .navigationTitle("Notes")
            .navigationDestination(for: Route.self) { dest in
                switch dest {
                case .UpsertScreen:
                    UpsertNoteScreen().environmentObject(viewModel)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            self.viewModel.setNote(note: nil)
                            path
                                .append(Route.UpsertScreen)
                            
                        } label: {
                            Image(systemName: "square.and.pencil")
                        }
                    }
                }
                .searchable(text: $viewModel.searchQuery,
                            prompt: "Search title"
                )
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

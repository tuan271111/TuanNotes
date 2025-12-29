//
//  ContentView.swift
//  TuanLab
//
//  Created by Nguyễn Đăng Quốc Tuấn on 29/12/25.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var store = NoteStore()
    @State private var showAdd = false

    var body: some View {
        NavigationStack {
            List {
                if store.notes.isEmpty {
                    Text("No notes yet. Tap + to add one.")
                        .foregroundColor(.gray)
                } else {
                    ForEach(store.notes) { note in
                        NavigationLink {
                            NoteDetailView(note: note)
                        } label: {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(note.title)
                                    .font(.headline)
                                Text(note.createdAt, style: .date)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .onDelete(perform: store.deleteNote)
                }
            }
            .navigationTitle("TuanNotes")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAdd = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAdd) {
                AddNoteView(store: store)
            }
        }
    }
}

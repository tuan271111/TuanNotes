//
//  AddNoteView.swift
//  TuanLab
//
//  Created by Nguyễn Đăng Quốc Tuấn on 29/12/25.
//

import SwiftUI

struct AddNoteView: View {

    @Environment(\.dismiss) private var dismiss

    @ObservedObject var store: NoteStore

    @State private var title: String = ""
    @State private var content: String = ""

    @State private var showAlert = false

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Title")) {
                    TextField("Enter title...", text: $title)
                }

                Section(header: Text("Content")) {
                    TextEditor(text: $content)
                        .frame(height: 200)
                }
            }
            .navigationTitle("New Note")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        saveNote()
                    }
                }
            }
            .alert("Missing title", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text("Please enter a title for your note.")
            }
        }
    }

    private func saveNote() {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedTitle.isEmpty {
            showAlert = true
            return
        }

        store.addNote(title: trimmedTitle, content: content)
        dismiss()
    }
}

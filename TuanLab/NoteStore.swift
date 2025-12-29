//
//  NoteStore.swift
//  TuanLab
//
//  Created by Nguyễn Đăng Quốc Tuấn on 29/12/25.
//
import SwiftUI
import Combine
import Foundation
final class NoteStore: ObservableObject {

    @Published var notes: [Note] = []

    private let key = "saved_notes"

    init() {
        load()
    }

    func addNote(title: String, content: String) {
        let newNote = Note(title: title, content: content)
        notes.insert(newNote, at: 0)
        save()
    }

    func deleteNote(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
        save()
    }

    func save() {
        do {
            let data = try JSONEncoder().encode(notes)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("Save error: \(error)")
        }
    }

    func load() {
        guard let data = UserDefaults.standard.data(forKey: key) else { return }
        do {
            notes = try JSONDecoder().decode([Note].self, from: data)
        } catch {
            print("Load error: \(error)")
        }
    }
}

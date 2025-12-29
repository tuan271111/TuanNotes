//
//  NoteDetailView.swift
//  TuanLab
//
//  Created by Nguyễn Đăng Quốc Tuấn on 29/12/25.
//

import SwiftUI

struct NoteDetailView: View {

    let note: Note

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {

                Text(note.title)
                    .font(.title2)
                    .fontWeight(.semibold)

                Text(note.createdAt, style: .date)
                    .font(.caption)
                    .foregroundColor(.gray)

                Divider()

                if note.content.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text("No content.")
                        .foregroundColor(.gray)
                } else {
                    Text(note.content)
                        .font(.body)
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

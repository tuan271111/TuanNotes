//
//  Node.swift
//  TuanLab
//
//  Created by Nguyễn Đăng Quốc Tuấn on 29/12/25.
//

import Foundation
struct Note: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var content: String
    var createdAt: Date = Date()
}

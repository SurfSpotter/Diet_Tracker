//
//  ToDoEntityImpl.swift
//  DietTracker
//
//  Created by Алексей Чигарских on 13.12.2022.
//

import Foundation

struct TodoAPIEntity: Codable {
    let id: Int
    let title: String
    let completed: Bool
}

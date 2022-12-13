//
//  ToDoEntityImpl.swift
//  DietTracker
//
//  Created by Алексей Чигарских on 13.12.2022.
//

import Foundation

//Struct of json file
struct IntakeAPIEntity: Codable {
    let id: Int
    let title: String
    let completed: Bool
}

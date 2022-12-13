//
//  TodoRepository.swift
//  DietTracker
//
//  Created by Алексей Чигарских on 13.12.2022.
//

import Foundation

protocol TodoRepository{
    
    func getTodos() async throws -> [Todo]
    
}

struct TodoRepositoryImpl: TodoRepository{
    
    var dataSource: TodoDataSource
    
    func getTodos() async throws -> [Todo] {
        let _todos =  try await dataSource.getTodos()
        return _todos
    }
}

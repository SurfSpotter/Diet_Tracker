//
//  TodoRepository.swift
//  DietTracker
//
//  Created by Алексей Чигарских on 13.12.2022.
//

import Foundation

protocol IntakeRepository{
    
    func getTodos() async throws -> [Intake]
    
}

struct IntakeRepositoryImpl: IntakeRepository{
    
    var dataSource: IntakeDataSource
    
    func getTodos() async throws -> [Intake] {
        let _todos =  try await dataSource.getTodos()
        return _todos
    }
}

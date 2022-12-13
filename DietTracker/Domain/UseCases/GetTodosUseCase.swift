//
//  GetTodosUseCase.swift
//  DietTracker
//
//  Created by Алексей Чигарских on 13.12.2022.
//

import Foundation

enum UseCaseError: Error{
    case networkError, decodingError
}

protocol GetTodos {
    func execute() async -> Result<[Todo], UseCaseError>
}

struct GetTodosUseCase: GetTodos{
    var repo: TodoRepository
    
    func execute() async -> Result<[Todo], UseCaseError>{
        do{
            let todos = try await repo.getTodos()
            return .success(todos)
        }catch(let error){
            switch(error){
            case APIServiceError.decodingError:
                return .failure(.decodingError)
            default:
                return .failure(.networkError)
            }
        }
    }
}

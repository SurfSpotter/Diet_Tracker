//
//  TodoAPIImpl.swift
//  DietTracker
//
//  Created by Алексей Чигарских on 13.12.2022.
//

import Foundation

enum APIServiceError: Error{
    case badUrl, requestError, decodingError, statusNotOK
}

struct TodoAPIImpl: TodoDataSource{
    
       
    func getTodos() async throws -> [Todo] {
        
        return [Todo(id: 1, title: "One", isCompleted: true),
                Todo(id: 2, title: "Two", isCompleted: true),
                Todo(id: 3, title: "Three", isCompleted: false)]
    }
}

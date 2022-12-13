//
//  TodoListViewModel.swift
//  DietTracker
//
//  Created by Алексей Чигарских on 13.12.2022.
//

import Foundation

@MainActor
class TodoListViewModel: ObservableObject {
    
    var getTodosUseCase = GetTodosUseCase(repo: TodoRepositoryImpl(dataSource: TodoAPIImpl()))
    @Published var todos: [Todo] = []
    @Published var errorMessage = ""
    @Published var hasError = false
    
    func getTodos() async {
        errorMessage = ""
        let result = await getTodosUseCase.execute()
        switch result{
        case .success(let todos):
            self.todos = todos
        case .failure(let error):
            self.todos = []
            errorMessage = error.localizedDescription
            hasError = true
        }
    }
}

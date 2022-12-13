//
//  TodoListViewModel.swift
//  DietTracker
//
//  Created by Алексей Чигарских on 13.12.2022.
//

import Foundation

@MainActor
class IntakeListInteractor: ObservableObject {
    
    var getTodosUseCase = GetIntakesUseCase(repo: IntakeRepositoryImpl(dataSource: IntakeLocalDBImpl()))
    @Published var todos: [Intake] = []
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

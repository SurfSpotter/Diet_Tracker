//
//  DietTrackerApp.swift
//  DietTracker
//
//  Created by Алексей Чигарских on 07.12.2022.
//

import SwiftUI
import HealthKit

@main
struct DietTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            TodoListView()
        }
    }
}

//MARK: Model
struct Todo: Identifiable {
    let id: Int
    let title: String
    let isCompleted: Bool
}

struct TodoAPIEntity: Codable {
    let id: Int
    let title: String
    let completed: Bool
}

//MARK: DataSource
protocol TodoDataSource{
    
    func getTodos() async throws -> [Todo]
    
}

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

//MARK: Repository
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

//MARK: UseCases
enum UseCaseError: Error{
    case networkError, decodingError
}

protocol GetTodos {
    func execute() async -> Result<[Todo], UseCaseError>
}

import Foundation


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
//MARK: Presentation layer
//MARK: ViewModel
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

//MARK: View
struct TodoListView: View {
    @StateObject var vm = TodoListViewModel()
    
    
    fileprivate func listRow(_ todo: Todo) -> some View {
        HStack{
            Image(systemName: todo.isCompleted ? "checkmark.circle": "circle")
                .foregroundColor(todo.isCompleted ? .green : .red)
            Text("\(todo.title)")
        }
    }
    
    fileprivate func TodoList() -> some View {
        List {
            ForEach(vm.todos){ item in
                listRow(item)
            }
        }
        .navigationTitle("Todo List")
        .task {
           await vm.getTodos()
        }
        .alert("Error", isPresented: $vm.hasError) {
        } message: {
            Text(vm.errorMessage)
        }
    }
    
    var body: some View {
       TodoList()
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        TodoListView()
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

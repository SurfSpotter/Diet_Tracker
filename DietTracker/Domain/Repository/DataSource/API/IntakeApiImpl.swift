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

struct IntakeApiImpl: IntakeDataSource{
    
       
    func getTodos() async throws -> [Intake] {
        
        return [Intake(id: 1, title: "1st meal(remote)", isCompleted: true),
                Intake(id: 2, title: "2st meal(remote)", isCompleted: true),
                Intake(id: 3, title: "3st meal(remote)", isCompleted: true),
                Intake(id: 4, title: "4st meal(remote)", isCompleted: true),
                Intake(id: 5, title: "5st meal(remote)", isCompleted: true)]
    }
}

//
//  LocalDataSource.swift
//  DietTracker
//
//  Created by Алексей Чигарских on 13.12.2022.
//

import Foundation

//This file must implement local data storage like CoreData of Realm
struct IntakeLocalDBImpl: IntakeDataSource{
    
       
    func getTodos() async throws -> [Intake] {
        
        return [Intake(id: 1, title: "1st meal", isCompleted: true),
                Intake(id: 2, title: "2st meal", isCompleted: true),
                Intake(id: 3, title: "3st meal", isCompleted: true),
                Intake(id: 4, title: "4st meal", isCompleted: true),
                Intake(id: 5, title: "5st meal", isCompleted: true)]
    }
}

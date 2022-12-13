//
//  TodoDataSource.swift
//  DietTracker
//
//  Created by Алексей Чигарских on 13.12.2022.
//

import Foundation

protocol IntakeDataSource{
    
    func getTodos() async throws -> [Intake]
    
}

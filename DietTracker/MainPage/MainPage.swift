//
//  ContentView.swift
//  DietTracker
//
//  Created by Алексей Чигарских on 07.12.2022.
//

import SwiftUI
import HealthKit

struct MainPage: View {
    
    public let healthStore = HKHealthStore()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            if HKHealthStore.isHealthDataAvailable() {
                requestPermissions()
            }
        }
    }
    
    public func requestPermissions() {
        let readDataTypes : Set = [HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)!]
        
        healthStore.requestAuthorization(toShare: nil, read: readDataTypes, completion: { (success, error) in
            if success {
                print("Authorization complete")
            } else {
                print("Authorization error: \(String(describing: error?.localizedDescription))")
            }
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

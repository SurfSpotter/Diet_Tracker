//
//  ContentView.swift
//  DietTracker
//
//  Created by Алексей Чигарских on 07.12.2022.
//

import SwiftUI

struct MainPage: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
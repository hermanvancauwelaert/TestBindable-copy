//
//  TestBindableApp.swift
//  TestBindable
//
//  Created by Herman VAN CAUWELAERT on 28/10/2024.
//

import SwiftUI
import SwiftData

@main
struct TestBindableApp: App {
    let container = try! ModelContainer(for: CounterModel.self)
    
    init() {
        // Initialize the counter when app starts
        let _ = CounterModel.getOrCreate(context: container.mainContext)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}

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
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            CounterModel.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView( )
        }
        .modelContainer(sharedModelContainer)
    }
}

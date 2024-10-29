//
//  Item.swift
//  TestBindable
//
//  Created by Herman VAN CAUWELAERT on 28/10/2024.
//

import SwiftUI
import SwiftData
import Foundation

// MARK: - Model
@Model class CounterModel {
    var count: Int

    init(count: Int = 0) {
        self.count = count
    }

    static func getOrCreate(context: ModelContext) -> CounterModel {
        let descriptor = FetchDescriptor<CounterModel>()
        let existing = try? context.fetch(descriptor)
        
        if let first = existing?.first {
            return first
        } else {
            let counter = CounterModel()
            context.insert(counter)
            return counter
        }
    }
}


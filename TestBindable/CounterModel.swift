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
}


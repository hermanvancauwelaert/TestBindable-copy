import SwiftUI
import SwiftData
//test

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var allCounterModels: [CounterModel] // Retrieve all instances
    private var counterModel: CounterModel? {
        allCounterModels.first
    }

    var body: some View {
        VStack {
            Text("Count: \(counterModel?.count ?? 0)")
                .font(.largeTitle)
                .padding()
            HStack {
                Button("Increment") {
                    incrementCount()
                }
                Button("Decrement") {
                    decrementCount()
                }
            }
            .padding()
        }
        .onAppear {
            createCounterModelIfNeeded()
        }
    }

    private func createCounterModelIfNeeded() {
        // Check if a CounterModel already exists in the context; if not, create one.
        if counterModel == nil {
            let newCounter = CounterModel(count: 0)
            context.insert(newCounter)
            saveChanges()
        }
    }

    private func incrementCount() {
        if let model = counterModel {
            model.count += 1
            saveChanges()
        }
    }

    private func decrementCount() {
        if let model = counterModel {
            model.count -= 1
            saveChanges()
        }
    }

    private func saveChanges() {
        do {
            try context.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}


import SwiftUI
import SwiftData
//test ploep

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.scenePhase) private var scenePhase
    @Query private var counters: [CounterModel]
    
    var body: some View {
        VStack {
            Text("\(counters[0].count)")
                .font(.largeTitle)
                .padding()
            HStack {
                Button("Increment") {
                    counters[0].count += 1
                }
                Button("Decrement") {
                    counters[0].count -= 1
                }
            }
            .padding()
            
            #if os(macOS)
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
            .padding()
            #elseif os(iOS)
            Button("Close") {
                UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
            }
            .padding()
            #endif
        }
        .onChange(of: scenePhase) { _, newPhase in
            if newPhase == .inactive {
                try? context.save()
            }
        }
    }
}


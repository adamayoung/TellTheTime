import SwiftUI

struct MacAppScene: Scene {

    @ObservedObject var model: AppModel

    @SceneBuilder var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
                .onAppear {
                    model.generateRandomDate()
                }
        }

        Settings {
            SettingsView()
                .padding()
                .frame(minWidth: 500)
                .environmentObject(model)
        }
    }

}

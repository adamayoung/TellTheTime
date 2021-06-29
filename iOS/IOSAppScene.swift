import SwiftUI

struct IOSAppScene: Scene {

    @ObservedObject var model: AppModel

    @SceneBuilder var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
                .onAppear {
                    model.generateRandomDate()
                }
        }
    }

}

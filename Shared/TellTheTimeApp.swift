import SwiftUI

@main
struct TellTheTimeApp: App {





    
    @StateObject private var model = AppModel()

    @SceneBuilder var body: some Scene {
        #if os(macOS)
        MacAppScene(model: model)
        #else
        IOSAppScene(model: model)
        #endif
    }

}

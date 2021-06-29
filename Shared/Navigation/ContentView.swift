import SwiftUI

struct ContentView: View {

    @State private var isShowingSettings = false
    @EnvironmentObject private var model: AppModel

    var body: some View {
        #if os(macOS)
        content
            .padding()
            .frame(minWidth: 600, minHeight: 600)
        #else
        ZStack(alignment: .top) {
            HStack {
                Spacer()
                Button(action: {
                    self.isShowingSettings = true
                }, label: {
                    Image(systemName: "gear")
                        .imageScale(.large)
                })
            }
            .padding(.horizontal)
            .padding(.top)

            content
        }
        .sheet(isPresented: $isShowingSettings) {
            SettingsView(isPresented: $isShowingSettings)
                .environmentObject(model)
        }
        #endif
    }

    private var content: some View {
        ClockView()
    }

}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
            .environmentObject(AppModel())
    }

}

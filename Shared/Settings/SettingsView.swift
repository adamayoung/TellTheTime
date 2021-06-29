import SwiftUI

struct SettingsView: View {

    #if os(iOS)
    @Binding var isPresented: Bool
    #endif

    @EnvironmentObject private var model: AppModel

    var body: some View {
        #if os(macOS)
        content
        #else
        NavigationView {
            content
                .navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button("Close") {
                            self.isPresented = false
                        }
                    }
                }
        }
        #endif
    }

    private var content: some View {
        Form {
            Section(header: Text("Clock Display")) {
                Toggle(isOn: $model.isMinuteGuideVisible) {
                    Text("Show minute guide")
                }

                Toggle(isOn: $model.isDigitalClockVisible) {
                    Text("Show digital clock")
                }

                Toggle(isOn: $model.isTimeSettable) {
                    Text("Manually set time")
                }
            }

            Section(header: Text("Time")) {
                Toggle(isOn: $model.isRoundToNearestFiveMinutes) {
                    Text("Round to the nearest 5 minutes")
                }
            }
        }
    }

}

struct SettingsView_Previews: PreviewProvider {

    static var previews: some View {
        #if os(macOS)
        SettingsView()
            .environmentObject(AppModel())
        #else
        SettingsView(isPresented: .constant(true))
            .environmentObject(AppModel())
        #endif
    }

}

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
                .navigationTitle("SETTINGS")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button("CLOSE") {
                            self.isPresented = false
                        }
                    }
                }
        }
        #endif
    }

    private var content: some View {
        Form {
            Section(header: Text("CLOCK_DISPLAY")) {
                Toggle(isOn: $model.isMinuteGuideVisible) {
                    Text("SHOW_MINUTE_GUIDE")
                }

                Toggle(isOn: $model.isHourNumbersVisible) {
                    Text("SHOW_HOUR_NUMBERS")
                }

                Toggle(isOn: $model.isDigitalClockVisible) {
                    Text("SHOW_DIGITAL_CLOCK")
                }
            }

            Section(header: Text("TIME")) {
                Toggle(isOn: $model.isTimeSettable) {
                    Text("MANUALLY_SET_TIME")
                }

                Toggle(isOn: $model.isRoundToNearestFiveMinutes) {
                    Text("ROUND_TO_THE_NEAREST_5_MINUTES")
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

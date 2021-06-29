import SwiftUI

struct ClockView: View {

    @EnvironmentObject private var model: AppModel

    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("WHATS_THE_TIME")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .frame(maxWidth: .infinity)

            Spacer()

            ZStack(alignment: .bottom) {
                ClockFace(
                    date: $model.date,
                    isMinuteGuideVisible: model.isMinuteGuideVisible,
                    isHourNumbersVisible: model.isHourNumbersVisible,
                    canSetTime: model.isTimeSettable
                )

                HStack {
                    Spacer()
                    Button(action: model.speakDate) {
                        #if os(macOS)
                        speakImage.frame(width: 30, height: 30)
                        #else
                        speakImage.frame(width: 30, height: 30)
                        #endif
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()

            Spacer()

            DigitalClock(date: model.date)
                .padding(.bottom)
                .opacity(model.isDigitalClockVisible ? 1 : 0)

            Spacer()

            Button(action: model.generateRandomDate) {
                Text("NEW_TIME")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
            }
            .background(Color.accentColor)
            .buttonStyle(PlainButtonStyle())
            .cornerRadius(30)
        }
        .padding()
        .frame(maxWidth: .infinity)
    }

    private var speakImage: some View {
        Image(systemName: "speaker.wave.2.circle")
            .resizable()
    }

}

struct ClockView_Previews: PreviewProvider {

    static var previews: some View {
        ClockView()
            .environmentObject(AppModel())
    }

}

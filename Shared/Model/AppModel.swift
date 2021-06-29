import SwiftUI

final class AppModel: ObservableObject {

    @Published var date: Date = Date()
    @AppStorage("minuteGuideVisible") var isMinuteGuideVisible = true
    @AppStorage("digitalClockVisible") var isDigitalClockVisible = false
    @AppStorage("roundToNearestFiveMinutes") var isRoundToNearestFiveMinutes = true
    @AppStorage("timeSettable") var isTimeSettable = false

    private let speechService: SpeechService

    init(speechService: SpeechService = AVSpeechService()) {
        self.speechService = speechService
    }

    func generateRandomDate() {
        let newDate = Date.random()
        if isRoundToNearestFiveMinutes {
            date = newDate.roundedToNearestFiveMinutes()
            return
        }

        date = newDate
    }

    func speakDate() {
        speechService.say(date.utteranceText)
    }

}

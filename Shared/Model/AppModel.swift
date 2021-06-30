import SwiftUI

final class AppModel: ObservableObject {

    @Published var date: Date
    @AppStorage("minuteGuideVisible") var isMinuteGuideVisible = true
    @AppStorage("hourNumbersVisible") var isHourNumbersVisible = true
    @AppStorage("digitalClockVisible") var isDigitalClockVisible = false
    @AppStorage("roundToNearestFiveMinutes") var isRoundToNearestFiveMinutes = true
    @AppStorage("timeSettable") var isTimeSettable = false

    private let speechService: SpeechService

    init(date: Date = .random(rounded: true), speechService: SpeechService = AVSpeechService()) {
        self.date = date
        self.speechService = speechService
    }

    func generateRandomDate() {
        self.date = Date.random(rounded: isRoundToNearestFiveMinutes)
    }

    func speakDate() {
        speechService.say(date.localizedString)
    }

}

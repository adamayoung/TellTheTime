@testable import TellTheTime
import Foundation

final class MockSpeechService: SpeechService {

    private(set) var lastSayText: String?

    func say(_ text: String) {
        self.lastSayText = text
    }

}

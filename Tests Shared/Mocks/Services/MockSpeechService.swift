import Foundation
@testable import TellTheTime

final class MockSpeechService: SpeechService {

    private(set) var lastSayText: String?

    func say(_ text: String) {
        self.lastSayText = text
    }

}

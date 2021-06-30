import AVFoundation
import Foundation

protocol SpeechService {

    func say(_ text: String)

}

final class AVSpeechService: SpeechService {

    private let synthesizer: AVSpeechSynthesizer

    init(synthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer()) {
        self.synthesizer = synthesizer
    }

    func say(_ text: String) {
        print(text)
        let utterance = AVSpeechUtterance(string: text)
        synthesizer.speak(utterance)
    }

}

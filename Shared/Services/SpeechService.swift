import AVFoundation
import Foundation

protocol SpeechService {

    func say(_ text: String)

}

final class AVSpeechService: SpeechService {

    private let synthesizer: AVSpeechSynthesizer
    private let voice: AVSpeechSynthesisVoice?

    init(
        synthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer(),
        voice: AVSpeechSynthesisVoice? = AVSpeechSynthesisVoice(
            identifier: "com.apple.ttsbundle.siri_female_en-GB_compact")
    ) {
        self.synthesizer = synthesizer
        self.voice = voice
    }

    func say(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = voice
        synthesizer.speak(utterance)
    }

}

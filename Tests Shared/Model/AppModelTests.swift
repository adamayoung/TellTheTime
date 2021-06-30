@testable import TellTheTime
import XCTest

class AppModelTests: XCTestCase {

    var model: AppModel!
    var mockSpeechService: MockSpeechService!

    override func setUpWithError() throws {
        try super.setUpWithError()

        mockSpeechService = MockSpeechService()
        model = AppModel(speechService: mockSpeechService)
    }

    override func tearDownWithError() throws {
        mockSpeechService = nil
        model = nil

        try super.tearDownWithError()
    }

    func testGenerateRandomDateWhenNotRoundedToNearestFiveMinutesSetsDifferentDates() {
        model.isRoundToNearestFiveMinutes = false
        model.generateRandomDate()
        let date1 = model.date

        model.generateRandomDate()
        let date2 = model.date

        XCTAssertNotEqual(date1, date2)
    }

    func testGenerateRandomDateWhenRoundedToNearestFiveMinutesSetsDifferentDates() {
        model.isRoundToNearestFiveMinutes = true
        model.generateRandomDate()
        let date1 = model.date

        model.generateRandomDate()
        let date2 = model.date

        XCTAssertNotEqual(date1, date2)
    }

    func testGenerateRandomDateWhenRoundedToNearestFiveMinutesSetsDateToNearestFiveMinutes() {
        model.isRoundToNearestFiveMinutes = true

        for _ in 1...5 {
            model.generateRandomDate()
            let date = model.date
            let minute = Calendar.current.component(.minute, from: date)
            print(minute)

            XCTAssertTrue(minute % 5 == 0)
        }
    }

    func testSpeakDate() {
        let expectedResult = model.date.localizedString

        model.speakDate()
        let result = mockSpeechService.lastSayText

        XCTAssertEqual(result, expectedResult)
    }

}

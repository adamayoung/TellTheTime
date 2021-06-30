import SwiftUI
@testable import TellTheTime
import XCTest

class DateClockTests: XCTestCase {

    func testInitWithHourMinuteReturnsDate() {
        let hour = 2
        let minute = 28
        let date = Date(hour: hour, minute: minute)

        let hourResult = Calendar.current.component(.hour, from: date)
        let minuteResult = Calendar.current.component(.minute, from: date)

        XCTAssertEqual(hourResult, hour)
        XCTAssertEqual(minuteResult, minute)
    }

    func testHourAngleWhen12Hours0MinutesReturnsAngle() {
        let date = Date(hour: 12, minute: 0)
        let expectedResult = Angle(degrees: 360)

        let result = date.hourAngle

        XCTAssertEqual(result, expectedResult)
    }

    func testHourAngleWhen3Hours0MinutesReturnsAngle() {
        let date = Date(hour: 3, minute: 0)
        let expectedResult = Angle(degrees: 90)

        let result = date.hourAngle

        XCTAssertEqual(result, expectedResult)
    }

    func testHourAngleWhen3Hours30MinutesReturnsAngle() {
        let date = Date(hour: 3, minute: 30)
        let expectedResult = Angle(degrees: 105)

        let result = date.hourAngle

        XCTAssertEqual(result, expectedResult)
    }

    func testHourAngleWhen6Hours0MinutesReturnsAngle() {
        let date = Date(hour: 6, minute: 0)
        let expectedResult = Angle(degrees: 180)

        let result = date.hourAngle

        XCTAssertEqual(result, expectedResult)
    }

    func testHourAngleWhen6Hours30MinutesReturnsAngle() {
        let date = Date(hour: 6, minute: 30)
        let expectedResult = Angle(degrees: 195)

        let result = date.hourAngle

        XCTAssertEqual(result, expectedResult)
    }

    func testHourAngleWhen9Hours0MinutesReturnsAngle() {
        let date = Date(hour: 9, minute: 0)
        let expectedResult = Angle(degrees: 270)

        let result = date.hourAngle

        XCTAssertEqual(result, expectedResult)
    }

    func testHourAngleWhen9Hours45MinutesReturnsAngle() {
        let date = Date(hour: 9, minute: 45)
        let expectedResult = Angle(degrees: 292.5)

        let result = date.hourAngle

        XCTAssertEqual(result, expectedResult)
    }

    func testMinuteAngleWhen0MinutesReturnsAngle() {
        let date = Date(hour: 12, minute: 0)
        let expectedResult = Angle(degrees: 0)

        let result = date.minuteAngle

        XCTAssertEqual(result, expectedResult)
    }

    func testMinuteAngleWhen15MinutesReturnsAngle() {
        let date = Date(hour: 12, minute: 15)
        let expectedResult = Angle(degrees: 90)

        let result = date.minuteAngle

        XCTAssertEqual(result, expectedResult)
    }

    func testMinuteAngleWhen30MinutesReturnsAngle() {
        let date = Date(hour: 12, minute: 30)
        let expectedResult = Angle(degrees: 180)

        let result = date.minuteAngle

        XCTAssertEqual(result, expectedResult)
    }

    func testMinuteAngleWhen45MinutesReturnsAngle() {
        let date = Date(hour: 12, minute: 45)
        let expectedResult = Angle(degrees: 270)

        let result = date.minuteAngle

        XCTAssertEqual(result, expectedResult)
    }

    func testLocalizedStringWhen12OClockReturnsString() {
        let date = Date(hour: 12, minute: 0)
        let expectedResult = "It's 12 o'clock"

        let result = date.localizedString

        XCTAssertEqual(result, expectedResult)
    }

    func testLocalizedStringWhenQuarterPast3ReturnsString() {
        let date = Date(hour: 3, minute: 15)
        let expectedResult = "It's quarter past 3"

        let result = date.localizedString

        XCTAssertEqual(result, expectedResult)
    }

    func testLocalizedStringWhenHalfPast6ReturnsString() {
        let date = Date(hour: 6, minute: 30)
        let expectedResult = "It's half past 6"

        let result = date.localizedString

        XCTAssertEqual(result, expectedResult)
    }

    func testLocalizedStringWhenQuarterTo10ReturnsString() {
        let date = Date(hour: 9, minute: 45)
        let expectedResult = "It's quarter to 10"

        let result = date.localizedString

        XCTAssertEqual(result, expectedResult)
    }

    func testLocalizedStringWhen1MinutePastTo2ReturnsString() {
        let date = Date(hour: 2, minute: 1)
        let expectedResult = "It's 1 minute past 2"

        let result = date.localizedString

        XCTAssertEqual(result, expectedResult)
    }

    func testLocalizedStringWhen20MinutesPastTo4ReturnsString() {
        let date = Date(hour: 4, minute: 20)
        let expectedResult = "It's 20 minutes past 4"

        let result = date.localizedString

        XCTAssertEqual(result, expectedResult)
    }

    func testLocalizedStringWhen25MinutesTo8ReturnsString() {
        let date = Date(hour: 7, minute: 35)
        let expectedResult = "It's 25 minutes to 8"

        let result = date.localizedString

        XCTAssertEqual(result, expectedResult)
    }

    func testLocalizedStringWhen1MinuteTo11ReturnsString() {
        let date = Date(hour: 10, minute: 59)
        let expectedResult = "It's 1 minute to 11"

        let result = date.localizedString

        XCTAssertEqual(result, expectedResult)
    }

    func testLocalizedStringWhenMidnightReturnsString() {
        let date = Date(hour: 0, minute: 0)
        let expectedResult = "It's 12 o'clock"

        let result = date.localizedString

        XCTAssertEqual(result, expectedResult)
    }

}

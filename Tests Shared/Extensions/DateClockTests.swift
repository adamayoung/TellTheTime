@testable import TellTheTime
import SwiftUI
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

}

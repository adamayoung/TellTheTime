import SwiftUI

enum ClockArmType {

    case hour
    case minute

    typealias Ratio = (lineWidth: CGFloat, margin: CGFloat)
    private static let hourRatio: Ratio = (lineWidth: 1 / 2, margin: 2 / 5)
    private static let minuteRatio: Ratio = (lineWidth: 1 / 3, margin: 1 / 8)

    var ratio: Ratio {
        switch self {
        case .hour:
            return Self.hourRatio

        case .minute:
            return Self.minuteRatio
        }
    }

    var color: Color {
        switch self {
        case .hour:
            return .primary

        case .minute:
            return .primary
        }
    }

    func angle(date: Date) -> Angle {
        switch self {
        case .hour:
            return date.hourAngle

        case .minute:
            return date.minuteAngle
        }
    }

    func date(forAngle angle: Angle, from date: Date) -> Date {
        var date = date
        switch self {
        case .hour:
            date.setHour(angle: angle)
            return date

        case .minute:
            date.setMinute(angle: angle)
            return date
        }
    }

}

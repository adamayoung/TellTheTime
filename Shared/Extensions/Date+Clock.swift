import SwiftUI

extension Date {

    init(hour: Int, minute: Int, calendar: Calendar = .current) {
        self.init()
        self = calendar.date(bySettingHour: hour, minute: minute, second: 0, of: self) ?? self
    }

    var hourAngle: Angle {
        let minute = Double(Calendar.current.component(.minute, from: self))
        let minuteInHour = minute > 0 ? minute / 60 : 0
        let hour = Double(Calendar.current.component(.hour, from: self)) + minuteInHour

        let relationship: Double = 360 / 12
        let degrees = hour * relationship
        return Angle(degrees: degrees)
    }

    var minuteAngle: Angle {
        let minute = Double(Calendar.current.component(.minute, from: self))
        let relationship: Double = 360 / 60
        return Angle(degrees: Double(minute) * relationship)
    }

    mutating func setHour(angle: Angle) {
        let hour = Int((positiveDegrees(angle: angle) / Double.hourInDegree).rounded())
        let minute = Calendar.current.component(.minute, from: self)
        self = Calendar.current.date(bySettingHour: hour, minute: minute, second: 0, of: self) ?? self
    }

    mutating func setMinute(angle: Angle) {
        let minute = Int((positiveDegrees(angle: angle) / Double.minuteInDegree).rounded())
        let hour = Calendar.current.component(.hour, from: self)
        self = Calendar.current.date(bySettingHour: hour, minute: minute, second: 0, of: self) ?? self
    }

    var localizedString: String {
        var hour = Calendar.current.component(.hour, from: self)
        if hour == 0 {
            hour = 12
        }

        var nextHour = hour + 1
        if nextHour > 12 {
            nextHour = 1
        }
        let minute = Calendar.current.component(.minute, from: self)

        switch minute {
        case 15:
            return .localizedStringWithFormat(NSLocalizedString("QUARTER_PAST_H", comment: "Quarter past H"), hour)

        case 30:
            return .localizedStringWithFormat(NSLocalizedString("HALF_PAST_H", comment: "Half past H"), hour)

        case 45:
            return .localizedStringWithFormat(NSLocalizedString("QUARTER_TO_H", comment: "Quarter to H"), nextHour)

        case 1..<30:
            return .localizedStringWithFormat(NSLocalizedString("M_MINUTES_PAST_H", comment: "M minutes past H"),
                                              minute, hour)

        case 31..<60:
            let toMinute = 60 - minute
            return .localizedStringWithFormat(NSLocalizedString("M_MINUTES_TO_H", comment: "M minutes to H"), toMinute,
                                              nextHour)

        default:
            return .localizedStringWithFormat(NSLocalizedString("H_OCLOCK", comment: "H o'clock"), hour)
        }
    }

}

extension Date {

    private func positiveDegrees(angle: Angle) -> Double {
        angle.degrees > 0 ? angle.degrees : angle.degrees + 360
    }

}

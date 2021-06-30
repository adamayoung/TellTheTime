import Foundation

extension Date {

    static func random(rounded: Bool) -> Date {
        let hour = Int.random(in: 1...12)
        let minute = Int.random(in: 0...59)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        let date = dateFormatter.date(from: "\(hour):\(minute)")!
        if !rounded {
            return date
        }

        return date.roundedToNearestFiveMinutes()
    }

    func roundedToNearestFiveMinutes() -> Date {
        let minute = Calendar.current.component(.minute, from: self)
        let remainder = minute % 5
        if remainder == 0 {
            return self
        }

        let timeInterval = (remainder > 2 ? TimeInterval(5 - remainder) : TimeInterval(-remainder)) * 60

        return self.addingTimeInterval(timeInterval)
    }

}

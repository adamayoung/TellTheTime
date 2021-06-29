import Foundation

extension Date {

    static func random() -> Date {
        let hour = Int.random(in: 1...12)
        let minute = Int.random(in: 0...59)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        return dateFormatter.date(from: "\(hour):\(minute)")!
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

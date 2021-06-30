import SwiftUI

struct Clock: View {

    @Binding var date: Date
    var isMinuteGuideVisible = true
    var isHourNumbersVisible = true
    var canSetTime: Bool = true

    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        ZStack {
            ClockOutline()
            HourIndicators()
            MinuteIndicators()
            if isMinuteGuideVisible {
                MinuteGuide()
                MinuteGuideNumbers()
            }
            if isHourNumbersVisible {
                HourNumbers()
            }
            ClockHand(type: .hour, date: $date, canChange: canSetTime)
            ClockHand(type: .minute, date: $date, canChange: canSetTime)
            Circle()
                .foregroundColor(colorScheme == .dark ? .black : .white)
                .frame(width: 5, height: 5)
        }
        .aspectRatio(1, contentMode: .fit)
    }

}

struct Clock_Previews: PreviewProvider {

    static var previews: some View {
        Clock(date: .constant(Date()))
            .previewLayout(.sizeThatFits)
    }

}

import SwiftUI

struct MinuteGuideNumbers: View {

    private static let minutes = [0, 5, 10, 15, 20, 25, 30, -25, -20, -15, -10, -5]

    var body: some View {
        ForEach(Self.minutes, id: \.self) { minute in
            let formattedMinute = minute > 0 ? minute : minute * -1

            Text(verbatim: "\(formattedMinute)")
                .modifier(PositionInCircle(
                    angle: .degrees(Double(minute) * .minuteInDegree),
                    marginRatio: 0.47
                ))
                .modifier(FontProportional(ratio: 2 / 30))
        }
    }

}

struct MinuteGuideNumbers_Previews: PreviewProvider {

    static var previews: some View {
        ZStack {
            MinuteGuideNumbers()
        }
        .aspectRatio(1, contentMode: .fit)
        .previewLayout(.sizeThatFits)
    }

}

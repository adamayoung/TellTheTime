import SwiftUI

struct MinuteIndicators: View {

    private static let minutes = 1..<61

    var body: some View {
        ForEach(Self.minutes, id: \.self) { minute in
            Rectangle()
                .frame(width: 2, height: 10)
                .rotationEffect(.degrees(Double(minute) * .minuteInDegree))
                .modifier(PositionInCircle(
                    angle: .degrees(Double(minute) * .minuteInDegree),
                    marginRatio: 0.095
                ))
        }
    }

}

struct MinuteIndicators_Previews: PreviewProvider {

    static var previews: some View {
        MinuteIndicators()
            .aspectRatio(1, contentMode: .fit)
            .previewLayout(.sizeThatFits)
    }

}

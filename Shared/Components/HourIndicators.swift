import SwiftUI

struct HourIndicators: View {

    private static let hours = 1..<13

    var body: some View {
        ForEach(Self.hours, id: \.self) { hour in
            Rectangle()
                .frame(width: 5, height: 30)
                .rotationEffect(.degrees(Double(hour) * .hourInDegree))
                .modifier(PositionInCircle(
                    angle: .degrees(Double(hour) * .hourInDegree),
                    marginRatio: 0.095
                ))
        }
    }

}

struct HourIndicators_Previews: PreviewProvider {

    static var previews: some View {
        HourIndicators()
            .aspectRatio(1, contentMode: .fit)
            .previewLayout(.sizeThatFits)
    }

}

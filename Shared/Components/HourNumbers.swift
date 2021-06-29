import SwiftUI

struct HourNumbers: View {

    private static let hours = 1..<13

    var body: some View {
        ForEach(Self.hours) { hour in
            Text("\(hour)")
                .modifier(PositionInCircle(
                    angle: .degrees(Double(hour) * .hourInDegree),
                    marginRatio: 2 / 7
                ))
                .modifier(FontProportional(ratio: 1 / 6))
        }
    }

}

struct HourNumbers_Previews: PreviewProvider {

    static var previews: some View {
        ZStack {
            Circle().stroke()
            HourNumbers()
        }
        .padding()
        .aspectRatio(1, contentMode: .fit)
        .previewLayout(.sizeThatFits)
    }

}

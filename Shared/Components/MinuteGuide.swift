import SwiftUI

struct MinuteGuide: View {

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .trim(from: 0, to: 0.5)
                    .stroke(lineWidth: geometry.radius / 7)
                    .rotation(Angle(degrees: -90))
                    .foregroundColor(.blue)

                Circle()
                    .trim(from: 0, to: 0.5)
                    .stroke(lineWidth: geometry.radius / 7)
                    .rotation(Angle(degrees: 90))
                    .foregroundColor(.red)

                Text("PAST")
                    .modifier(PositionInCircle(
                        angle: .degrees(Double(3) * .hourInDegree),
                        marginRatio: 3.3 / 7
                    ))
                    .modifier(FontProportional(ratio: 1 / 6))

                Text("TO")
                    .modifier(PositionInCircle(
                        angle: .degrees(Double(9) * .hourInDegree),
                        marginRatio: 3.3 / 7
                    ))
                    .modifier(FontProportional(ratio: 1 / 6))
            }
            .padding(geometry.radius / 2.1)
        }
    }

}

struct MinuteGuide_Previews: PreviewProvider {

    static var previews: some View {
        ZStack {
            Circle().stroke()
            MinuteGuide()
        }
        .aspectRatio(1, contentMode: .fit)
        .previewLayout(.sizeThatFits)
    }

}

import SwiftUI

struct ClockHand: View {

    var type: ClockArmType
    @Binding var date: Date
    var canChange: Bool = false

    private var rotationAngle: Angle {
        type.angle(date: date)
    }

    var body: some View {
        Group {
            if canChange {
                arm
                    .modifier(ArmDragGesture(type: type, date: $date))
            } else {
                arm
            }
        }
        .rotationEffect(rotationAngle)
        .animation(.spring(), value: rotationAngle)
    }

    private var arm: some View {
        ClockArm(type: type)
            .foregroundColor(type.color)
            .shadow(radius: 2)
    }

}

struct ClockHand_Previews: PreviewProvider {

    static var previews: some View {
        let date = Date()

        ZStack {
            ClockHand(type: .hour, date: .constant(date))
            ClockHand(type: .minute, date: .constant(date))
        }
        .aspectRatio(1, contentMode: .fit)
        .previewLayout(.sizeThatFits)
    }

}

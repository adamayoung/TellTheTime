import SwiftUI

struct ArmDragGesture: ViewModifier {

    let type: ClockArmType
    @Binding var date: Date

    @EnvironmentObject private var model: AppModel
    @GestureState private var dragAngle: Angle = .zero

    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .contentShape(self.contentShape(geometry: geometry))
                .gesture(self.dragGesture(geometry: geometry))
                .rotationEffect(self.dragAngle)
                .animation(self.dragAngle == .zero ? .spring() : nil, value: self.dragAngle)
        }
        .aspectRatio(1, contentMode: .fit)
    }

    private func contentShape(geometry: GeometryProxy) -> Path {
        Rectangle().path(in: CGRect(
            x: geometry.frame(in: .local).midX - geometry.size.width / 12,
            y: geometry.frame(in: .local).minY,
            width: geometry.size.width / 6,
            height: geometry.size.height / 1.9
        ))
    }

    private func dragGesture(geometry: GeometryProxy) -> some Gesture {
        DragGesture(coordinateSpace: .global)
            .updating($dragAngle) { value, state, _ in
                let extraRotationAngle = self.angle(dragGestureValue: value, frame: geometry.frame(in: .global))
                state = (extraRotationAngle - self.currentAngle)
            }
            .onEnded {
                self.setAngle(self.angle(dragGestureValue: $0, frame: geometry.frame(in: .global)))
            }
    }

    private var currentAngle: Angle {
        type.angle(date: date)
    }

    private func angle(dragGestureValue: DragGesture.Value, frame: CGRect) -> Angle {
        let radius = frame.size.width / 2
        let location = (
            x: dragGestureValue.location.x - radius - frame.origin.x,
            y: dragGestureValue.location.y - radius - frame.origin.y
        )
        #if os(macOS)
        let arctan = atan2(location.x, location.y)
        #else
        let arctan = atan2(location.x, -location.y)
        #endif
        let radians = Double(arctan >= 0 ? arctan : arctan + 2 * .pi)
        return .radians(radians)
    }

    private func setAngle(_ angle: Angle) {
        let newDate = type.date(forAngle: angle, from: date)
        if model.isRoundToNearestFiveMinutes {
            date = newDate.roundedToNearestFiveMinutes()
            return
        }

        date = newDate
    }

}

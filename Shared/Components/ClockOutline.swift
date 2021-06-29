import SwiftUI

struct ClockOutline: View {

    var body: some View {
        GeometryReader { geometry in
            Circle()
                .strokeBorder(lineWidth: geometry.radius / 35)
                .background(Circle().fill(Color.primary.opacity(0.05)))
                .shadow(radius: 5)
        }
    }

}

struct ClockOutline_Previews: PreviewProvider {

    static var previews: some View {
        ClockOutline()
            .aspectRatio(1, contentMode: .fit)
            .previewLayout(.sizeThatFits)
    }

}

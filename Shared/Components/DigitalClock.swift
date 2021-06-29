import SwiftUI

struct DigitalClock: View {

    var date: Date

    private var formattedTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm"
        return formatter.string(from: date)
    }

    var body: some View {
        Text(verbatim: "\(formattedTime)")
            .font(.system(.title, design: .monospaced))
    }

}

struct DigitalClock_Previews: PreviewProvider {

    static var previews: some View {
        DigitalClock(date: Date())
            .previewLayout(.sizeThatFits)
    }

}

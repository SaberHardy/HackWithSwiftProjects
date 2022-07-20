import SwiftUI

struct ForUITests: View {
    @State private var sleepAmount = 0.0
    @State private var wakeUpTime = Date.now
//
    // With some errors
//    var components = DateComponents([.hour, .minute], from: 1990)
//    let hour = components.hour ?? 0
//    let minute = components.minute ??
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Stepper("This is just stepper: \(sleepAmount.formatted())",
                            value: $sleepAmount,
                            in: 4...10)
                    
                    DatePicker("Time to wake up",
                               selection: $wakeUpTime,
                               in: Date.now...)
//                 displayedComponents: .date)
                        .labelsHidden()
                        
                    Spacer()
                    Text("Todays time and date")
                    Text(Date.now.formatted(date: .long, time: .shortened))
                        .foregroundColor(.mint)
                        .font(.largeTitle)
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Pickers")
        }
    }
    
//    func exmpleDates() {
//        let tomorrow = Date.now.addingTimeInterval(86400)
//        let range = Date.now...tomorrow
//    }
}

struct ForUITests_Previews: PreviewProvider {
    static var previews: some View {
        ForUITests()
    }
}

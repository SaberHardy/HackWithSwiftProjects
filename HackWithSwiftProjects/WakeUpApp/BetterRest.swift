import CoreML
import SwiftUI

struct BetterRest: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section("When do you want to wake up?") {
//                        Text("When dou want to wake up?")
//                            .font(.headline)
                        
                        DatePicker("Please choose time",
                                   selection: $wakeUp,
                                   displayedComponents: .hourAndMinute)
//                        .labelsHidden()
                    }
                    
                    Section("Desired amount of sleep") {
//                        Text("Desired amount of sleep")
//                            .font(.headline)
                        
                        Stepper("\(sleepAmount.formatted()) hours",
                                value: $sleepAmount,
                                in: 4...12,
                                step: 0.25
                        )
                    }
                    
                    Section("Daily coffee intake")  {
//                        Text("Daily coffee intake")
//                            .font(.headline)
                        Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                    }
                }
                .navigationTitle("Sleep needed")
                .toolbar {
                    Button("Calculate", action: calculateBedTime )
                }
                
                .alert(alertTitle, isPresented: $showAlert) {
                    Button("Ok") {}
                } message: {
                    Text(alertMessage)
                }
                
                Button(action: {
                    calculateBedTime()
                }, label: {
                      Text("Calculate BedTime")
                          .foregroundColor(.red)
                      //Makes the font colour of the text red
                })
            }
            
        }
    }
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute],
                                                             from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute),                                              estimatedSleep: sleepAmount,
                                                  coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bed time is ..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry there is an error inside this app"
        }
        showAlert = true
    }
}

struct BetterRest_Previews: PreviewProvider {
    static var previews: some View {
        BetterRest()
    }
}

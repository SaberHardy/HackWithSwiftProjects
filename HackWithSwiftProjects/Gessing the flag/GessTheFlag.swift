//
//  GessTheFlag.swift
//  HackWithSwiftProjects
//
//  Created by MacBook on 10.07.2022.
//

import SwiftUI

struct GessTheFlag: View {
    
    @State private var countries = ["Estonia", "Germany", "Ireland",
                                    "Italy", "Nigeria", "Poland",
                                    "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var myScore = 0
    
    var body: some View {
        ZStack {
            //            LinearGradient(gradient: Gradient(colors: [.blue, .black]),
            //                           startPoint: .top,
            //                           endPoint: .bottom)
            RadialGradient(
                stops: [
                    .init(color: Color(red:0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.8, green: 0.2, blue: 0.26), location: 0.3)
                ],
                center: .top,
                startRadius: 200,
                endRadius: 500)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Gess The Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                VStack(spacing: 15)  {
                    VStack {
                        Text("Tap the flag of")
                            .font(.headline.weight(.heavy))
                            .foregroundColor(.black)
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
//                            .foregroundColor(.white)
                            .foregroundStyle(.secondary)
                        
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                            askQuestion()
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                    Text("Your score: \(myScore) ")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
                
                Spacer()
            }

        }
//        .alert(scoreTitle, isPresented: $showingScore) {
//            Button("Continue", action: askQuestion)
//        } message: {
//            Text("Your score is \(myScore)")
//                .foregroundColor(.white)
//                .font(.title.bold())
//        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            myScore += 3
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct GessTheFlag_Previews: PreviewProvider {
    static var previews: some View {
        GessTheFlag()
    }
}

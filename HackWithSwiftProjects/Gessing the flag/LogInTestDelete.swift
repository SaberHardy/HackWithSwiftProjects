//
//  LogInTestDelete.swift
//  HackWithSwiftProjects
//
//  Created by MacBook on 13.07.2022.
//

import SwiftUI

struct LogInTestDelete: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            Color.mint.ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Log in")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    
                TextField("User name", text: $username)
                    .padding()
                    .background(.gray.opacity(0.2))
                    .font(.largeTitle)
                    .cornerRadius(20)
                
                TextField("Password", text: $password)
                    .padding()
                    .background(.gray.opacity(0.2))
                    .font(.largeTitle)
                    .cornerRadius(20)
                    
                Button("Log in") {
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.white)
                .foregroundColor(.black)
                .cornerRadius(20)
                
                Text("If you have not an accont please, register here!")
                    .foregroundColor(.secondary)
                
                Button("Register") {
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.white)
                .foregroundColor(.black)
                .cornerRadius(20)
                
                Spacer()
                
            }
            .padding()
        }
    }
}

struct LogInTestDelete_Previews: PreviewProvider {
    static var previews: some View {
        LogInTestDelete()
    }
}

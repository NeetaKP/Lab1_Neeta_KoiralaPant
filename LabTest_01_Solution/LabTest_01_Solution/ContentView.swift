//
//  ContentView.swift
//  LabTest_01_Solution
//
//  Created by Neeta Koirala Pant on 2025-02-08.
//

import SwiftUI

struct ContentView: View {
    @State private var currentNumber: Int = 0
    @State private var correctAnswers: Int = 0
    @State private var wrongAnswers: Int = 0
    @State private var attempts: Int = 0
    @State private var resultMessage: String = ""
    @State private var showResults: Bool = false
    @State private var timer: Timer? = nil
    @State private var lastNumberTime: Date = Date()

    var body: some View {
        VStack {


            Text("\(currentNumber)")
                .font(Font.custom("Tangerine-Bold", size:130))
                .padding(60)

            VStack {
                Button(action: {
                    checkAnswer(isPrime: true)
                }) {
                    Text("Prime")
                        .font(Font.custom("Tangerine-Bold",size:70))
                        .font(.title)

                }
                .padding(.bottom,80)
                
                Button(action: {
                    checkAnswer(isPrime: false)
                }) {
                    Text("Not Prime")
                        .font(Font.custom("Tangerine-Bold",size:70))
                        .font(.title)
  
                }
            }
            .padding(.bottom,80)

            Image(isPrime(currentNumber)==true ?"check":"close")
                .resizable()                
                .frame(width:50,height:50)

        }
    }

    // function to check prime-ness of number
    func isPrime(_ number: Int) -> Bool {
        if number < 2 { return false }
        for i in 2..<number {
            if number % i == 0 { return false }
        }
        return true
    }


}

#Preview {
    ContentView()
}

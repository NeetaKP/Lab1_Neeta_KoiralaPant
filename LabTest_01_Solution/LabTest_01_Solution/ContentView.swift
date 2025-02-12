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

    // function to check user's answer/response and update data
    func checkAnswer(isPrime userAnswer: Bool) {
        let correctAnswer = isPrime(currentNumber)

        if userAnswer == correctAnswer {
            resultMessage = "✅ Correct"
            correctAnswers += 1
        } else {
            resultMessage = "❌ Wrong"
            wrongAnswers += 1
        }

        attempts += 1
        checkEndGame()
        generateNewNumber()
    }

    // check attempts and limit
    func checkEndGame() {
        if attempts >= 10 {
		// to be completed
        }
    }

    // Generate a new random number
    func generateNewNumber() {
        currentNumber = Int.random(in: 1...100)
        lastNumberTime = Date()
    }



}

#Preview {
    ContentView()
}

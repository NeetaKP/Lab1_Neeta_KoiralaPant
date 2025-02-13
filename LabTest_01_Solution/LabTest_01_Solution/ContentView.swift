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
    @State private var appEndMessage: String = ""
    @State private var showResults: Bool = false
    @State private var timer: Timer? = nil
    @State private var lastNumberTime: Date = Date()
    @State private var flag: Bool = false
    @State private var trueAnswer: Bool = false

    var body: some View {
        VStack {


            Text("\(currentNumber)")
                 .font(Font.custom("Tangerine-Bold", size:100))
                .padding(40)
                .padding([.leading, .trailing],80)

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

            Image(trueAnswer==true && flag==true ?"check":"close")
                .resizable()
                .frame(width:50,height:50)

            // Text to display result message - message produced at the end
            Text(appEndMessage)
                .font(.title)
                .foregroundColor(appEndMessage == "Correct" ? .green : .red)
                .padding()

            Spacer()
        }
        .padding()
        .onAppear {
            startTimer()
        }
        .alert("Final Outcome", isPresented: $showResults) {
            Button("OK", role: .cancel) {
                resetApp()
            }
       } message: {
            Text("Correct answers: \(correctAnswers)\nWrong answers: \(wrongAnswers)")
        }
 
    }
    
    func setFlag() {
        flag = true
    }
    func resetFlag() {
        flag  = false
    }

    // timer-start function - updates number every 5 seconds
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            checkMissedAnswer()
            generateNewNumber()
        }
        generateNewNumber() // Generate the first number immediately
    }

    // Generate a new random number
    func generateNewNumber() {
        currentNumber = Int.random(in: 1...100)
        appEndMessage = "" 
        lastNumberTime = Date()
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
        setFlag()
        if userAnswer == correctAnswer{
            appEndMessage = "Correct"
            correctAnswers += 1
            trueAnswer = true
        } else {
            appEndMessage = "Wrong"
            wrongAnswers += 1
            resetFlag()
            trueAnswer = false
        }

        attempts += 1
        checkEndApp()
        generateNewNumber()
    }

    // function to check response missed in 5 seconds period
    func checkMissedAnswer(){
        let timeSinceLastNumber = Date().timeIntervalSince(lastNumberTime)
        if timeSinceLastNumber >= 4.9 {
            wrongAnswers += 1
            attempts += 1
            checkEndApp()
        }
    }

    // check attempts and limit
    func checkEndApp() {
        if attempts >= 10 {
            timer?.invalidate()
            showResults = true
        }
    }

    // Function to reset the app
    func resetApp() {
        correctAnswers = 0
        wrongAnswers = 0
        attempts = 0
        resetFlag()
        trueAnswer = false
        
        startTimer()
    }
}

        
#Preview {
    ContentView()
}

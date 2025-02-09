//
//  ContentView.swift
//  LabTest_01_Solution
//
//  Created by Neeta Koirala Pant on 2025-02-08.
//

import SwiftUI

struct ContentView: View {
    @State private var choosedWrongAnswerCount=0
    @State private var attemptsCompleted=0
    @State private var  summary = false
    @State private var num = Int.random( in:1...100)
    @State private var isAnswerCorrect: Bool? = nil
    @State private  var choosedRightAnswerCount = 0
    
    
    @ViewBuilder var body:some View{
        
        VStack{
            Text("\(num)")
                .font(.system(size:89, weight:.bold))
                .padding()
            Button(action:{buttonClicked(primeSelected:true) }){
                Text("Prime")
                    .font(.system(size:40))
            }
            //Spacer()
            //padding()
            
            Button(action:{buttonClicked(primeSelected:false) }){
                Text("non Prime")
            }
        }
        
    }
    func buttonClicked(primeSelected:Bool){
               let correctOptionChoosen  = isPrime(num)
               if primeSelected == correctOptionChoosen{
                   isAnswerCorrect = true
                   choosedRightAnswerCount += 1
                   
                   
               }else{
                   isAnswerCorrect = false
                   choosedWrongAnswerCount += 1
               }
               
               updateAnswer()
               
    }
   func updateAnswer(){
               //        attemptsCompleted += 1
               //        if attempts >= 10{
               //            summary = true
               //
               //        }else{
               //            nextNumber()
               //        }
               //
               //
               //
   }
           
   func isPrime(_ n: Int) -> Bool {
               if n < 2 {return false}
               for i in 2..<n {
                   if n % i == 0 {return false}
               }
               
               return true
   }

}
    
             
             
#Preview {
    ContentView()
}

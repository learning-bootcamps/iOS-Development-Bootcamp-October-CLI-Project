//
//  main.swift
//  Quiz CLI App
//
//  Created by Abdullah Aljahdali on 19/10/2023.
//

import Foundation



func LoadQuestions() {
    print("Questions loaded successfully.") //--> adding by me
}

func startQuiz() {
    print("If you want to load the quiz, please enter 1. If not, please enter 0")

    while true  {
        if let readInput = readLine() {
            do {
                if let choice =  Int(readInput) {
                    if choice == 1 {
                        LoadQuestions()
                    } else if choice == 0 {
                        break
                    } else {
                        print("Please pick between 0 and 1")
                    }
                } else {
                    print("Please enter a valid number (0 or 1)")
                }
            }
        }
    }
}

startQuiz()

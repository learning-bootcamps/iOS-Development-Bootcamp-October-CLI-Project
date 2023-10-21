//
//  main.swift
//  Quiz CLI App
//
//  Created by Abdullah Aljahdali on 19/10/2023.
//

import Foundation

let questionAsString = """
What is Git?:A version control system.:A nickname for GitHub.:A remote repository platform.:A programming language.:0
What is the command to get the installed version of Git?:git --version.:gitVersion.:git help version.:getGitVersion.:0
Which option should you use to set the default user name for every repository on your computer?:--A.:--global.:--all.:No need to specify, that is the default.:1
What is the command to set the user email for the current repository?:git email.user.:git config user.email.:git config email.:git switch user.email.:1
What is the command to initialize Git on the current repository?:initialize git.:git start.:start git.:git init.:3
"""

struct Questions{
var answers:String
}
func LoadQuestions() {
    print("Questions loaded successfully.") //--> adding by me
}

func startQuiz() {
    print("If you want to load the quiz, please enter 1. If not, please enter 0")
    var correctCounter:Int = 0
    while true  {
        let readInput = readLine()
        if  readInput{
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
    } if readInput == Questions().answers{
        correctCounter += 1
    }
}

startQuiz()

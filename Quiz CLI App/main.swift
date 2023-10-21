//
//  main.swift
//  Quiz CLI App
//
//  Created by Abdullah Aljahdali on 19/10/2023.
//

import Foundation

struct Question {
    let points: Int
    let text: String
    let answers: [String]
    let answerIndex: Int
}

struct Quiz {
    var questionsArray : [Question] = []
    var totalPoints : Int = 0
}

enum LoadErrors : Error {
    case formatError, expectedInt
}


func LoadQuestions(from str : String,with number: Int) throws -> Quiz {
    
    let questions = str.components(separatedBy: "\n")
    
    if questions.count != number {
        throw LoadErrors.formatError
    }
    
    var quiz = Quiz()
    
    for question in questions {
        let parts = question.components(separatedBy: ":")
    
        if parts.count != 6 {
            throw LoadErrors.formatError
        }
        
        
        if let correctAnswerIndex = Int(parts[5]){
            let tempQestion = Question(points: 1, text: parts[0], answers: Array(parts[1...4]), answerIndex: correctAnswerIndex)
            quiz.questionsArray.append(tempQestion)
        }else{
            throw LoadErrors.expectedInt
        }
        
    }
        
    return quiz
}





let questionAsString = """
What is Git?:A version control system.:A nickname for GitHub.:A remote repository platform.:A programming language.:0
What is the command to get the installed version of Git?:git --version.:gitVersion.:git help version.:getGitVersion.:0
Which option should you use to set the default user name for every repository on your computer?:--A.:--global.:--all.:No need to specify, that is the default.:1
What is the command to set the user email for the current repository?:git email.user.:git config user.email.:git config email.:git switch user.email.:1
What is the command to initialize Git on the current repository?:initialize git.:git start.:start git.:git init.:3
"""



func startQuiz() {
    printPrettyMenu()
    
    do{
        var quiz = try LoadQuestions(from: questionAsString, with: 5)
        var shouldExit = false
        
        while !shouldExit {
            if let readInput = readLine() {
                if let choice = Int(readInput) {
                    switch choice {
                    case 1:
                        quiz.totalPoints = startQuestions(with: quiz.questionsArray)
                        print("\n")
                        print("Your Total Score is \(quiz.totalPoints).")
                        print("Good Bye.👋🏻")
                        shouldExit = true
                    case 0:
                        print("End")
                        shouldExit = true
                    default:
                        print("Please pick between 0 and 1")
                    }
                } else {
                    print("Please enter a valid number (0 or 1)")
                }
            }
        }
    }catch{
        print(error)
    }
    
}



func printPrettyMenu(){
    print("""
    =======================================
    =         Welcome To Quiz App         =
    =======================================
    =   Please Select a Service:          =
    =   1) Start Quiz                     =
    =   0) Quit                           =
    =======================================
    Your choice:
    """,terminator: " ")
}

func test(for question: Question) -> Int{
    
    print(String(repeating: "=", count: question.text.count))
    print(question.text)
    
    for index in 0..<question.answers.count {
        print("\(index)) \(question.answers[index])")
    }
        
    repeat {
        print("Your choice:", terminator: " ")
        if let input = readLine(){
            if let answerIndex = Int(input){
                if answerIndex < 0 || answerIndex > 3 {
                    print("unexpected answer. please choose another.")
                    continue
                }
                
                if answerIndex == question.answerIndex {
                    return question.points
                }
                else{
                    return 0
                }
            }else{
                print("unexpected answer. please choose another.")
            }
        }else{
            print("You need to entry only numbers.")
        }
    } while true
}

func startQuestions(with questions: [Question]) -> Int{
    var totalScore = 0
    for question in questions {
        totalScore += test(for: question)
    }
    return totalScore
}


startQuiz()

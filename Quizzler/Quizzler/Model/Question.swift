//
//  Question.swift
//  Quizzler
//
//  Created by salfetkafive on 27.09.2024.
//


struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        self.correctAnswer = correctAnswer
    }
}

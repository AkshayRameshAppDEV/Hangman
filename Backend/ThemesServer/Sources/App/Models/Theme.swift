//
//  File.swift
//  
//
//  Created by Akshay Ramesh on 4/5/21.
//

struct Theme: Codable {

    var wordOfTheDay: String
    var clue: String

    init(wordOfTheDay: String, clue: String) {
        self.wordOfTheDay = wordOfTheDay
        self.clue = clue
    }
}

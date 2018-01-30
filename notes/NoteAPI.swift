//
//  NoteAPI.swift
//  project 5
//
//  Created by Ksenia Zhizhimontova on 10/27/17.
//  Copyright © 2017 ksenia. All rights reserved.
//

import Foundation

class NoteAPI{
    static func getiCloudNotes() -> [Note] {
        let notes = [
            Note(title: "Classes for SP18", note: "Math 2930, Phil 1110, CS 2800, Phys 2213"),
            Note(title: "Office Hours for F18", note: "Math - Mon, Tue 2:30")
        ]
        return notes
    }
    
    static func getLectureNotes() -> [Note] {
        let notes = [
            Note(title: "Math", note: "Here are the math notes"),
            Note(title: "Chemistry", note: "Here are the chem notes"),
            Note(title: "Philosophy", note: "Here are the phil notes")
        ]
        return notes
    }
    
    static func getHomework() -> [Note] {
        let notes = [
            Note(title: "Physics", note: "Study for quiz"),
            Note(title: "Math", note: "Do the problem set"),
            Note(title: "Bio", note: "Prepare for the lab")
        ]
        return notes
    }
    
    static func getiPhoneNotes() -> [Note] {
        let notes = [
            Note(title: "Events on Campus", note: "Whatever Denice Cassaro sent")
        ]
        return notes
    }
    
}

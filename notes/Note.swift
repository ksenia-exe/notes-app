//
//  Note.swift
//  project 5
//
//  Created by Ksenia Zhizhimontova on 10/27/17.
//  Copyright © 2017 ksenia. All rights reserved.
//

import UIKit

class Note: NSObject {
    
    // image, song name, artist name and album name
    
    var title: String
    var note: String
    
    init( title: String = "Untitled", note: String = "No additional text") {
        
        self.title = title
        self.note = note
       
        super.init()
    }
    
}

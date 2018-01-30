//
//  Folder.swift
//  project 5
//
//  Created by Ksenia Zhizhimontova on 10/28/17.
//  Copyright © 2017 ksenia. All rights reserved.
//

import UIKit

class Folder: NSObject {
    
    // image, song name, artist name and album name
    
    var folderTitle: String
    var folderList: [Note]
    
    init( folderTitle: String, folderList: [Note]) {
        
        self.folderTitle = folderTitle
        self.folderList = folderList
        
        super.init()
    }
    
}

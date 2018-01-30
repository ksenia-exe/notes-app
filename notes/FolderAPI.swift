//
//  FolderIPI.swift
//  project 5
//
//  Created by Ksenia Zhizhimontova on 10/28/17.
//  Copyright © 2017 ksenia. All rights reserved.
//

import Foundation

class FolderAPI{
    var title: String
    var folders: [Folder]
    
    init(titled: String, includeFolders: [Folder])
    {
        title = titled
        folders = includeFolders
    }
    class func foldersList() -> [FolderAPI]
    {
        return [self.iCloud(), self.oniPhone()]
    }
    
    private class func iCloud() -> FolderAPI{
        var folders = [Folder]()
        folders.append(Folder(folderTitle: "Notes", folderList: NoteAPI.getiCloudNotes()))
        folders.append(Folder(folderTitle: "Lecture Notes", folderList: NoteAPI.getLectureNotes()))

        
        return FolderAPI(titled: "ICLOUD", includeFolders: folders)
    }
    
    private class func oniPhone() -> FolderAPI{
        var folders = [Folder]()
        folders.append(Folder(folderTitle: "Homework", folderList: NoteAPI.getHomework()))
        folders.append(Folder(folderTitle: "Notes", folderList: NoteAPI.getiPhoneNotes()))
        
        
        return FolderAPI(titled: "ON MY IPHONE", includeFolders: folders)
    }
    
}

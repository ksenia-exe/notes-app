//
//  FolderDetailTableViewCell.swift
//  project 5
//
//  Created by Ksenia Zhizhimontova on 10/28/17.
//  Copyright © 2017 ksenia. All rights reserved.
//


import UIKit


class FolderDetailTableViewCell: UITableViewCell {
    
    static let height: CGFloat = 60
    
    let padding: CGFloat = 1
    let height: CGFloat = FolderDetailTableViewCell.height
    
    var noteTitleLabel: UILabel!
    var noteNoteLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        frame.size.height = height
        
        //let labelHeight = (height - 2 * padding) / 3 - padding
        //let labelWidth = frame.width - 2 * padding
        noteTitleLabel = UILabel(frame: CGRect(x: 19, y: 10, width: frame.width, height: 16))
        noteTitleLabel.font = noteTitleLabel.font.withSize(16)
        noteNoteLabel = UILabel(frame: CGRect(x:  19, y: noteTitleLabel.frame.maxY + 9, width: frame.width, height: 19))
        noteNoteLabel.font = noteNoteLabel.font.withSize(14)
        noteNoteLabel.textColor = UIColor.lightGray
        
        contentView.addSubview(noteTitleLabel)
        contentView.addSubview(noteNoteLabel)
       
    
    }
    
    func setupWithNote(note: Note) {
        noteTitleLabel.text = note.title
        noteNoteLabel.text = note.note
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

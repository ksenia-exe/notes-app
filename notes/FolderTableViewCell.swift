//
//  FolderTableViewCell.swift
//  project 5
//
//  Created by Ksenia Zhizhimontova on 10/28/17.
//  Copyright © 2017 ksenia. All rights reserved.
//

import UIKit



class FolderTableViewCell: UITableViewCell {
    
    static let height: CGFloat = 40
    
    //let padding: CGFloat = 2
    let height: CGFloat = FolderTableViewCell.height
    
    var folderTitleLabel: UILabel!
    var folderNoteCount: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        frame.size.height = height
        folderTitleLabel = UILabel(frame: CGRect(x: 16, y: 0, width: frame.width, height: height))
        folderNoteCount = UILabel(frame: CGRect(x: UIScreen.main.bounds.width - 45, y: 0, width: frame.width, height: height))

        contentView.addSubview(folderTitleLabel)
        contentView.addSubview(folderNoteCount)
        
    }
    
    func setupWithFolder(folder: Folder) {
        folderTitleLabel.text = folder.folderTitle
        folderNoteCount.text = ("\(folder.folderList.count)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

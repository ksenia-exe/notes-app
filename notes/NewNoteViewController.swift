//
//  NewNoteViewController.swift
//  project 5
//
//  Created by Ksenia Zhizhimontova on 10/28/17.
//  Copyright © 2017 ksenia. All rights reserved.
//

import UIKit

class NewNoteViewController: UIViewController {
    
    let padding: CGFloat = 50
    let noteTitleTextFieldHeight: CGFloat = 30
    let editButtonPadding: CGFloat = 5
    let noteNoteLabelHeight: CGFloat = 100
    
    var editButton: UIBarButtonItem!
    var noteNoteLabel: UITextView!
    var noteTitleTextField: UITextField!
   
    
    var notes: [Note]!
    var folder: Folder
    
    init(folder: Folder) {
        self.folder = folder
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = folder.folderList
        
        noteTitleTextField = UITextField(frame: CGRect(x: 20, y: 60, width: view.frame.width, height: noteTitleTextFieldHeight))
        
        noteTitleTextField.text = "New Note"
        view.addSubview(noteTitleTextField)
        
        noteNoteLabel = UITextView(frame: CGRect(x: 20, y: noteTitleTextField.frame.maxY + 20, width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height - 70))
        
        noteNoteLabel.backgroundColor = UIColor.clear
        noteNoteLabel.font = .systemFont(ofSize: 17)
        noteNoteLabel.text = "No additional text"
        
        view.addSubview(noteNoteLabel)
        
        editButton = UIBarButtonItem(title: "Add New Note", style: .done, target: self, action:#selector(didPressEditButton))
        navigationItem.rightBarButtonItem = editButton
        
        
        updateWithSong()
    }
    
    func updateWithSong() {
//        noteNoteLabel.text = note.note
//        noteTitleTextField.text = note.title
        notes.append(Note(title: ("\(noteTitleTextField.text ?? "New Note")"), note: ("\(noteNoteLabel.text)")))
    }
    
    @objc func didPressEditButton() {
        print("appended ")
        notes.append(Note(title: ("\(noteTitleTextField.text ?? "New Note")"), note: ("\(noteNoteLabel.text)")))

        self.navigationController?.popViewController(animated: true)
    }
}


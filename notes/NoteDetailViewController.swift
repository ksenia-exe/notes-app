//
//  NoteDetailViewController.swift
//  project 5
//
//  Created by Ksenia Zhizhimontova on 10/28/17.
//  Copyright © 2017 ksenia. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
    
    let padding: CGFloat = 50
    let noteTitleTextFieldHeight: CGFloat = 30
    let editButtonPadding: CGFloat = 5
    let noteNoteLabelHeight: CGFloat = 100
    
    var editButton: UIBarButtonItem!
    var noteNoteLabel: UITextView!
    var noteTitleTextField: UITextField!
    var note: Note
    
    init(note: Note) {
        self.note = note
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteTitleTextField = UITextField(frame: CGRect(x: 20, y: 60, width: view.frame.width, height: noteTitleTextFieldHeight))
       
        noteTitleTextField.text = note.title
        view.addSubview(noteTitleTextField)
        
        noteNoteLabel = UITextView(frame: CGRect(x: 17, y: noteTitleTextField.frame.maxY + 20, width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height - 70))
        
        noteNoteLabel.backgroundColor = UIColor.clear
        noteNoteLabel.font = .systemFont(ofSize: 17)
        noteNoteLabel.text = note.note
        
        view.addSubview(noteNoteLabel)
        
        editButton = UIBarButtonItem(title: "Save", style: .done, target: self, action:#selector(didPressEditButton))
        navigationItem.rightBarButtonItem = editButton
        
        
        updateWithSong()
    }
    
    func updateWithSong() {
        noteNoteLabel.text = note.note
        noteTitleTextField.text = note.title
    }
    
    @objc func didPressEditButton() {
        note.title = noteTitleTextField.text ?? ""
        note.note = noteNoteLabel.text ?? ""
        self.navigationController?.popViewController(animated: true)
        updateWithSong()
    }
}

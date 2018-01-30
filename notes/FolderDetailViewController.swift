//
//  FolderDetailViewController.swift
//  project 5
//
//  Created by Ksenia Zhizhimontova on 10/28/17.
//  Copyright © 2017 ksenia. All rights reserved.
//

import UIKit

class FolderDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var noteTableView: UITableView!
    
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
        
        notes = folder.folderList //RestAPI.getSongs()
        navigationItem.rightBarButtonItem = editButtonItem
        
        title = folder.folderTitle
        noteTableView = UITableView(frame: view.frame)
        noteTableView.backgroundColor = .clear
        noteTableView.dataSource = self
        noteTableView.delegate = self
        noteTableView.register(FolderDetailTableViewCell.self, forCellReuseIdentifier: "FolderDetailTableViewCell")
        noteTableView.rowHeight = FolderDetailTableViewCell.height
        noteTableView.tableFooterView = UIView(frame: CGRect.zero)
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.backgroundColor = UIColor.white
        toolbar.center = CGPoint(x: view.frame.width/2, y: UIScreen.main.bounds.height - 20)
        
        var items = [UIBarButtonItem]()
        items.append(UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action:#selector(didPressNewButton)))
        //let flexible = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        toolbar.setItems(items, animated: true)
        view.addSubview(noteTableView)
        view.addSubview(toolbar)
        
        newNote()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        noteTableView.reloadData()
    }
    
    func newNote() {
        //let indexPath = IndexPath(row: notes.count - 1)
        //let newNoteViewController = NewNoteViewController(note: notes[indexPath.row])
        //navigationController?.pushViewController(newNoteViewController, animated: false)
    }
    
    @objc func didPressNewButton() {
//        let indexPath = IndexPath(row: notes.count - 1, section:0 )
        print("did press")
        let newNoteViewController = NewNoteViewController(folder: folder)
        self.navigationController?.pushViewController(newNoteViewController, animated: false)
       
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = noteTableView.dequeueReusableCell(withIdentifier: "FolderDetailTableViewCell", for: indexPath) as? FolderDetailTableViewCell else { return UITableViewCell() }
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        //cell.delegate = self
        cell.setupWithNote(note: notes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let noteDetailViewController = NoteDetailViewController(note: notes[indexPath.row])
        navigationController?.pushViewController(noteDetailViewController, animated: false)
    }
    
    
    
    // Deleting
    override func setEditing(_ editing: Bool, animated: Bool) {
        if(editing && !noteTableView.isEditing){
            noteTableView.setEditing(true, animated: true)
        }else{
            noteTableView.setEditing(false, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    // Moving Cells

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        let noteToMove = notes[sourceIndexPath.row]
        notes.insert(noteToMove, at: destinationIndexPath.row)
        notes.remove(at: sourceIndexPath.row)
    }

    
}


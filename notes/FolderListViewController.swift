//
//  FolderListViewController.swift
//  project 5
//
//  Created by Ksenia Zhizhimontova on 10/27/17.
//  Copyright © 2017 ksenia. All rights reserved.
//

import UIKit

class FolderListViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    var folderTableView: UITableView!
    
    var foldersList: [FolderAPI] = {
        return FolderAPI.foldersList()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = UIColor(red: 255/255, green: 203/255, blue: 5/255, alpha: 1.00)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        //navigationController?.navigationBar.
        title = "Notes"
        folderTableView = UITableView(frame: view.frame, style: .grouped)
        folderTableView.backgroundColor = .clear
        folderTableView.dataSource = self
        folderTableView.delegate = self
        folderTableView.register(FolderTableViewCell.self, forCellReuseIdentifier: "FolderTableViewCell")
        folderTableView.rowHeight = FolderTableViewCell.height
        view.addSubview(folderTableView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        folderTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let folderList = foldersList[section]
        return folderList.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return foldersList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let folderList = foldersList[section]
        return folderList.folders.count   // the number of products in the section
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = folderTableView.dequeueReusableCell(withIdentifier: "FolderTableViewCell", for: indexPath) as? FolderTableViewCell else { return UITableViewCell() }
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        //cell.delegate = self
        
        let folderList = foldersList[indexPath.section]
        let folder = folderList.folders[indexPath.row]
        
        cell.setupWithFolder(folder: folder)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let folderList = foldersList[indexPath.section]
        let folder = folderList.folders[indexPath.row]
        let folderDetailViewController = FolderDetailViewController(folder: folder)
        navigationController?.pushViewController(folderDetailViewController, animated: false)
    }
}



//
//  WriteOwnStoryViewController.swift
//  bother
//
//  Created by Eyüp Mert on 17.07.2022.
//

import UIKit



class WriteOwnStoryViewController: UIViewController {
    
    // MARK: - Variables
    

    // MARK: - Outlets
   
    
    @IBOutlet weak var tableView: UITableView!
    // MARK: - Actions
    
    @IBAction func actionBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
    // MARK: - Statements
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension WriteOwnStoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WriteYourOwnStoryCellID", for: indexPath) as! WriteYourOwnStoryCell

        cell.pickerData = [categoryArray[indexPath.row]]
        cell.pickerViewCategory.reloadAllComponents();
        
        return cell
    }
    
    
    
    
}

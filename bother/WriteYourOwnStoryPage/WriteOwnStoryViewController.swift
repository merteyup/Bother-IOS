//
//  WriteOwnStoryViewController.swift
//  bother
//
//  Created by Eyüp Mert on 17.07.2022.
//

import UIKit


// TODO: Back button should be fade in for users which will not sign in.

protocol WriteOwnStoryViewControllerDelegate : AnyObject {
    func newStorySendPressed()
}


class WriteOwnStoryViewController: UIViewController {
    
    // MARK: - Variables
    weak var writeOwnStoryViewControllerDelegate : WriteOwnStoryViewControllerDelegate?
    

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

        cell.writeYourOwnStoryCellDelegate = self
        cell.pickerData = [categoryArray[indexPath.row]]
        cell.pickerViewCategory.reloadAllComponents();
        
        return cell
    }
    
    
    
    
}


extension WriteOwnStoryViewController: WriteYourOwnStoryCellDelegate {
    
    func sendPressed() {
        // TODO: Here we should reload tableview data, and send user back to the selectedcategoryviewcontroller with new array from database.
        self.dismiss(animated: true) {
            BotherUser.shared.setSessionBotherLimit(sessionBotherLimit: 10)
            botherArray = loremIpsum.components(separatedBy: ["!", ".", "?"])
            self.writeOwnStoryViewControllerDelegate?.newStorySendPressed()
        }
    }
    
}

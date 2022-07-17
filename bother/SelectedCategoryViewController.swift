//
//  SelectedCategoryViewController.swift
//  bother
//
//  Created by Eyüp Mert on 15.07.2022.
//

import UIKit
import FirebaseAuth

class SelectedCategoryViewController: UIViewController {
    
    
    // TODO: Can be anything without violence, sex, terrorism, etc.
    
    // MARK: - Variables
    var categoryId = Int()
    var isDailyBotherFinished = false
    
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var btnLogOut: UIButton!
    
    // MARK: - Actions
    @IBAction func actionDismiss(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func btnResetDailyBother(_ sender: Any) {
        
        print("pressed")
        
        DispatchQueue.main.async {
                self.openWriteYourStoryPage()
        }
            
        
       
    }
    
    @IBAction func actionLogOut(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
                print("Signed Out")
                dismiss(animated: true)
            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)
            }
        } else {
            print("CurrentUser == Nil")
        }
    }
    
 
    // MARK: - Statements
    override func viewDidLoad() {
        super.viewDidLoad()
        
        botherArray.removeSubrange(2..<botherArray.count)
      
        
        if let savedBother = UserDefaults.standard.value(forKey: "currentStory") as? String {
            botherArray.append(savedBother)
        }
        
    }
    
  
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkAuthForBtnAlpha()
        
    }
    
    // MARK: - Functions
    
    fileprivate func checkAuthForBtnAlpha() {
        if Auth.auth().currentUser != nil {
            btnLogOut.alpha = 1
        } else {
            btnLogOut.alpha = 0
        }
    }
    
}


// MARK: - Extensions
extension SelectedCategoryViewController: UITableViewDelegate, ActionYesOrNoDelegate {
    
    func actionYesOrNoClicked(answer: Int) {
        print("SelectedAnswer: \(answer)")
    }
    
    func actionYesOrNoClicked(cell: SelectedCategoryTableViewCell) {
        if Auth.auth().currentUser != nil {
            if let indexPath = self.tableView.indexPath(for: cell){
                if botherArray.count > 0 {
                    botherArray.remove(at: indexPath.row - 1)
                    if let dailyBotherLimit = BotherUser.shared.getDailyBotherLimit() {
                        BotherUser.shared.setDailyBotherLimit(dailyBotherLimit: dailyBotherLimit - 1)
                    }
                } else {
                    isDailyBotherFinished = true
                }
            }
            self.tableView.reloadData()
        } else {
            DispatchQueue.main.async {
                self.openSignInViewController()
            }
        }
    }
}

extension SelectedCategoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if botherArray.count > 0 {
            
            return botherArray.count + 1
        } else {
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            if botherArray.count != 0 {
                return 0
            } else {
                return UITableView.automaticDimension
            }
        } else {
            return UITableView.automaticDimension
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DailyLimitAchievedTableViewCellID", for: indexPath) as! DailyLimitAchievedTableViewCell
            
            cell.headerAchievedLmt.text = "Finished, share your own bother with 3 friends, get 10 more."
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectedCategoryTableViewCellID", for: indexPath) as! SelectedCategoryTableViewCell
            cell.actionYesOrNoDelegate = self
            cell.selectedCategoryTitle.text = botherArray[indexPath.row - 1]
            return cell
        }
    }
    
}


//
//  WriteOwnStoryViewController.swift
//  bother
//
//  Created by Eyüp Mert on 17.07.2022.
//

import UIKit
import FirebaseAuth
import FirebaseFunctions


// TODO: Back button should be fade in for users which will not sign in.

protocol WriteOwnStoryViewControllerDelegate : AnyObject {
    func newStorySendPressed()
}


class WriteOwnStoryViewController: UIViewController {
    
    // MARK: - Variables
    weak var writeOwnStoryViewControllerDelegate : WriteOwnStoryViewControllerDelegate?
    lazy var functions = Functions.functions();


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
    
    
    
    func createStoryCloud (bother: Bother) {
        if let currentUser = Auth.auth().currentUser?.uid {
                var parameters = ["firebaseUID" : currentUser,
                                  "category" : bother.botherCategory,
                                  "botherText": bother.botherText,
                                  "title" : bother.botherTitle]
                as [String : Any]
                functions.httpsCallable("createStoryCloud").call(parameters){ (result, error) in
                    if error == nil{
                        
                        print("FuncWorked :\(result?.data)")
                        if let firstArray = result?.data as? NSArray{
                            //   self.spliceArrayAndGetOneListing(array : firstArray)
                        }
                    } else {
                        print("FuncWorkedNo")
                        //  SCLAlertView().showError("main.Error".l10n(), subTitle: "main.Please*try*again".l10n())
                    }
                }
            }
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
    func sendPressed(bother: Bother) {
        // TODO: Here we should reload tableview data, and send user back to the selectedcategoryviewcontroller with new array from database.
        self.dismiss(animated: true) {
            

            self.createStoryCloud(bother: bother)
            BotherUser.shared.setSessionBotherLimit(sessionBotherLimit: 10)
            botherArray = loremIpsum.components(separatedBy: ["!", ".", "?"])
            self.writeOwnStoryViewControllerDelegate?.newStorySendPressed()
        }
    }
    
}

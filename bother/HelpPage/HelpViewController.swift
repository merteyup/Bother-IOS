//
//  HelpViewController.swift
//  bother
//
//  Created by Eyüp Mert on 2.08.2022.
//

import UIKit
import FirebaseFunctions
import FirebaseAuth
import SCLAlertView

class HelpViewController: UIViewController {

    
    // MARK: - Variables
    lazy var functions = Functions.functions();

    // MARK: - Outlets
    @IBOutlet weak var headerHelp: UILabel!
    @IBOutlet weak var txtHelp: UITextView!
    
    // MARK: - Actions
    
    @IBAction func actionBack(_ sender: UIButton) {
        dismiss(animated: true)

        
        
        
    }
    
    @IBAction func actionSaveHelp(_ sender: UIButton) {
        sender.isUserInteractionEnabled = false
        if let userText = txtHelp.text {
            if let currentUser = Auth.auth().currentUser?.uid {
                var parameters = ["firebaseUID" : currentUser,
                                  "category" : 20,
                                  "botherText": userText,
                                  "title" : "User Help Or Feedback"]
                as [String : Any]
                functions.httpsCallable("createStoryCloud").call(parameters){ (result, error) in
                    if error == nil{
                        SCLAlertView().showSuccess("main.Thanks".l10n(), subTitle: "main.Your*feedback*has*reached*us".l10n()).setDismissBlock {
                            self.dismiss(animated: true)
                        }
                    } else {
                         SCLAlertView().showError("main.Error".l10n(), subTitle: "main.Please*try*again".l10n())
                    }
                }
            } else {
                openSignInViewController(selectedMainCategory: 1)
            }
        } else {
            runAfterDelay(0.3) {
            let alertView = SCLAlertView()
            alertView.addButton("main.Done".l10n()) {
                self.dismiss(animated: true)
            }
            alertView.showError("main.Oopss".l10n(), subTitle: "main.Write*something*please".l10n())
            }
        }
        runAfterDelay(3) {
            sender.isUserInteractionEnabled = true
        }
    }
    
    
    
    // MARK: - Statements
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
   

}

//
//  ProfileViewController.swift
//  bother
//
//  Created by Eyüp Mert on 15.07.2022.
//

import UIKit
import FirebaseAuth
import SCLAlertView
import L10n_swift


class SignUpViewController: UIViewController {
    
    
    // MARK: - Variables
    var selectedMainCategory : Int = 0

    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!

    
    // MARK: - Actions
   
    @IBAction func actionBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    // MARK: - Statements
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
     
        /*
       if Auth.auth().currentUser != nil {
            DispatchQueue.main.async {
                self.openSelectedCategory(categoryId: selectedMainCategory)
            }
        }
         */
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        
        var handle = Auth.auth().addStateDidChangeListener { auth, user in
            if user != nil {
              //  self.lblAuthState.text = "Logged In"
            } else {
               // self.lblAuthState.text = "Logged Out"
            }
        }
    }
    
    // TODO: Here's a wrong alert showing.
    // MARK: - Functions
    func createUpdateUserObject() {
        if let user = Auth.auth().currentUser {
            let uid = user.uid
            let email = user.email
            let photoURL = user.photoURL
            var multiFactorString = "MultiFactor: "
            for info in user.multiFactor.enrolledFactors {
                multiFactorString += info.displayName ?? "[DispayName]"
                multiFactorString += " "
                BotherUser.shared.setName(name: multiFactorString)
            }
            BotherUser.shared.setEmail(email: email)
            BotherUser.shared.setFirebaseUID(firebaseUID: uid)
            BotherUser.shared.setSessionBotherLimit(sessionBotherLimit: 30)
            BotherUser.shared.setUserRole(userRole: 2)
            BotherUser.createUpdateUser { result in
                self.dismiss(animated: true) {
                    SCLAlertView().showSuccess("main.User*Created".l10n(), subTitle: "main.Enjoy*your*time".l10n(), closeButtonTitle: "Done").setDismissBlock {
                        DispatchQueue.main.async {
                            self.dismiss(animated: true,completion: {
                                self.presentingViewController?.dismiss(animated: true)
                            })
                            NotificationCenter.default.post(name: Notification.Name(rawValue: "newUserCreated"), object: self.selectedMainCategory, userInfo: nil);
                        }
                    }
                }
            }
        } else {
            
            DispatchQueue.main.async {
                SCLAlertView().showError("main.Something*went*wrong.".l10n(), subTitle: "main.Please*try*again*or*report*us.".l10n())
            }
        }
    }
}

// MARK: - Extensions
extension SignUpViewController : UITableViewDelegate {
    
    
}

extension SignUpViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SignUpPageCell1ID", for: indexPath) as! SignUpPageCell1
        cell.signUpPageCell1Delegate = self
        return cell
    }
}

extension SignUpViewController: SignUpPageCell1Delegate {
    func alreadyMemberClicked() {
        DispatchQueue.main.async {
            self.openSignInViewController(selectedMainCategory: self.selectedMainCategory)
        }
    }
    
    
    func signUpClicked() {
        // TODO: Move this into selectedCategoryHelper.signUp()
        if let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? SignUpPageCell1 {
            if let email = cell.txtEmail.text {
                if let password = cell.txtPassword.text {
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        BotherUser.shared.setAuthMethod(authMethod: 0)
                        self.createUpdateUserObject()
                    }
                } else {
                    SCLAlertView().showError("main.There's*no*Password.".l10n(), subTitle: "main.Please*enter*one".l10n())
                }
            } else {
                SCLAlertView().showError("main.There's*no*E-mail*address.".l10n(), subTitle: "main.Please*enter*one*mail".l10n())
            }
        }
    }
}

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}

//
//  ProfileViewController.swift
//  bother
//
//  Created by Eyüp Mert on 15.07.2022.
//

import UIKit
import FirebaseAuth


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
    
    // MARK: - Functions
    // TODO: Move this into signUpHelper.signUp()
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
                // TODO:
            NotificationCenter.default.post(name: Notification.Name(rawValue: "newUserCreated"), object: selectedMainCategory, userInfo: nil);
            print("AlertButtonWorked")
            dismiss(animated: true) {
                self.openSelectedCategory(selectedMainCategory: self.selectedMainCategory)
            }
            
        } else {
            print ("Error: User Not Created")
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
    
    func signUpClicked() {
        // TODO: Move this into selectedCategoryHelper.signUp()
        if let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? SignUpPageCell1 {
            if let email = cell.txtEmail.text {
                if let password = cell.txtPassword.text {
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        self.createUpdateUserObject()
                        print("SignUp")
                    }
                } else {
                    ("Print: There's no Password. Enter mail address")
                }
            } else {
                ("Print: There's no email. Enter mail address")
            }
        }
    }
}

//
//  SignInViewController.swift
//  bother
//
//  Created by Eyüp Mert on 17.07.2022.
//

import UIKit
import SCLAlertView
import FirebaseAuth
import FirebaseCore


class SignInViewController: UIViewController {
    
    
    // MARK: - Variables
    var selectedMainCategory : Int = 0
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func actionBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func actionRegister(_ sender: Any) {
        openSignUpViewController(selectedMainCategory: selectedMainCategory)
    }
    
    // MARK: - Statements
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("SelectedMainCategory1: \(selectedMainCategory)")
        
    }
    
}



// MARK: - Extensions
extension SignInViewController : UITableViewDelegate {
    
}
extension SignInViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SignInPageCell1ID", for: indexPath) as! SignInPageCell1
        cell.signInPageCell1Delegate = self
        return cell
    }
}
extension SignInViewController : SignInPageCell1Delegate {
    
    func resetPasswordClicked() {
        if let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? SignInPageCell1 {
            if let email = cell.emailSignIn.text {
                if email.isValidEmail {
                    Auth.auth().sendPasswordReset(withEmail: email) { error in
                    // TODO: Localize
                    SCLAlertView().showInfo("Check your mailbox for password restore mail. ", subTitle: "You are great")
                    }
                } else {
                    SCLAlertView().showInfo("Invalid E-mail", subTitle: "Please check your e-mail adress ")
                }
            }
        }
    }
    
    
    fileprivate func dismissMultipleViewControllers() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: {
            self.presentingViewController?.presentingViewController?.dismiss(animated: true)
        })
    }
    
    func signInClicked() {
        if let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? SignInPageCell1 {
            if let email = cell.emailSignIn.text {
                if let password = cell.passwordSignIn.text {
                    Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                        if let currentUser = Auth.auth().currentUser {
                            BotherUser.getUserInfoCloud { result in
                                if result {
                                    if self != nil {
                                        NotificationCenter.default.post(name: Notification.Name(rawValue: "userSignedIn"), object: self?.selectedMainCategory, userInfo: nil);
                                        self!.dismissMultipleViewControllers()
                                    }
                                } else {
                                    // TODO: Localization
                                    SCLAlertView().showError("Something went wrong.", subTitle: "Please try again or report us.")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    func googleSignInClicked() {
        print("")
    }
    
}

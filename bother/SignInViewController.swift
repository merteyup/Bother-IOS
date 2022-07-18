//
//  SignInViewController.swift
//  bother
//
//  Created by Eyüp Mert on 17.07.2022.
//

import UIKit
import FCAlertView
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
                        let alert = FCAlertView()
                        let homeImage = UIImage(systemName: "house", withConfiguration: nil)
                        DispatchQueue.main.async {
                            alert.showAlert(inView: self,
                                            withTitle: "E-Mail Sent",
                                            withSubtitle: "Check your mailbox for password restore mail. ",
                                            withCustomImage: homeImage,
                                            withDoneButtonTitle: "Okey",
                                            andButtons: nil) // Set your button titles here
                            alert.dismissOnOutsideTouch = true
                            alert.colorScheme = .red // Replace "Blue" with your preferred color from the image above
                            alert.titleColor = .purple
                            alert.subTitleColor = .orange
                            alert.autoHideSeconds = 5 // Replace 5 with the number of Seconds you'd like the view to appear for before dismissing itself
                            alert.cornerRadius = 4
                        }
                    }
                } else {
                    let alert = FCAlertView()
                    let homeImage = UIImage(systemName: "house", withConfiguration: nil)
                    DispatchQueue.main.async {
                        alert.showAlert(inView: self,
                                        withTitle: "Invalid E-mail",
                                        withSubtitle: "Please check your e-mail adress ",
                                        withCustomImage: homeImage,
                                        withDoneButtonTitle: "Okey",
                                        andButtons: nil) // Set your button titles here
                        alert.dismissOnOutsideTouch = true
                        alert.colorScheme = .red // Replace "Blue" with your preferred color from the image above
                        alert.titleColor = .purple
                        alert.subTitleColor = .orange
                        alert.autoHideSeconds = 5 // Replace 5 with the number of Seconds you'd like the view to appear for before dismissing itself
                        alert.cornerRadius = 4
                        
                    }
                }
            }
        }
    }
    
    func signInClicked() {
        if let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? SignInPageCell1 {
            if let email = cell.emailSignIn.text {
                if let password = cell.passwordSignIn.text {
                    Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                        guard let strongSelf = self else { return }
                        if let selfSafe = self {
                            if Auth.auth().currentUser != nil {
                                // TODO: Go to the feed from here.
                                print("actionSignInResult: User Logged In")
                                DispatchQueue.main.async {
                                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
                                    let vc = storyboard.instantiateViewController(withIdentifier: "MySubclassedTabBarControllerID") as! MySubclassedTabBarController;
                                    vc.selectedIndex = 0
                                    vc.modalPresentationCapturesStatusBarAppearance = true
                                    vc.modalPresentationStyle = .overFullScreen;
                                    selfSafe.present(vc, animated: false, completion: nil);
                                }
                            }
                        }
                    }
                }
            }
        }
        print("SignInClicked")
    }
    
    
    func googleSignInClicked() {
        
        print("")

        
    }
}

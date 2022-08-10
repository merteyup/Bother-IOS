//
//  ProfilePageViewController.swift
//  bother
//
//  Created by Eyüp Mert on 17.07.2022.
//

import UIKit
import FirebaseAuth
import SCLAlertView

class MorePageViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("CurrentUser: \(Auth.auth().currentUser?.email)")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
     func logOut() {
        if Auth.auth().currentUser != nil {
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
                SCLAlertView().showSuccess("main.Success".l10n(), subTitle: "main.Logged*Out".l10n())
            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)
            }
        } else {
            print("CurrentUser == Nil")
        }
    }
    
    func showAlertView() {
        DispatchQueue.main.async {
            // Create the alert controller
            let alertController = UIAlertController(title: "main.Are*You*Sure".l10n(), message: "main.Do*you*want*to".l10n(), preferredStyle: .alert)

                 // Create the actions
                let okAction = UIAlertAction(title: "Yes", style: .destructive) {
                     UIAlertAction in
                    self.logOut()
                 }
                let cancelAction = UIAlertAction(title: "No", style: .default) {
                     UIAlertAction in

                }

                 // Add the actions
                 alertController.addAction(okAction)
                 alertController.addAction(cancelAction)

                 // Present the controller
                 self.present(alertController, animated: true, completion: nil)
        }
    

}

}
extension MorePageViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            openSignUpViewController(selectedMainCategory: 0)
            
        } else if indexPath.row == 1 {
            // TODO: Change this app link with correct and live one.
            if let name = URL(string: "https://itunes.apple.com/us/app/myapp/idxxxxxxxx?ls=1&mt=8"), !name.absoluteString.isEmpty {
              let objectsToShare = [name]
              let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
              self.present(activityVC, animated: true, completion: nil)
            } else {
              // show alert for not available
            }
            
        } else if indexPath.row == 2 {
            
            openHowItWorkViewController()
            
        } else if indexPath.row == 3 {
            
            
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        } else if indexPath.row == 4 {
            

        } else if indexPath.row == 5 {
            
            openHelpViewController()

        } else if indexPath.row == 6 {

            openSelectLanguageViewController()

        } else if indexPath.row == 7 {
            showAlertView()

            
        } else if indexPath.row == 8 {

        }
        /* else if indexPath.row == 9 {
          //  openBuyMeCoffeePage()
        }
        */
        
        
        
        print("Selected Row \(indexPath.row)")
    }
    
}

extension MorePageViewController : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Hide row if user logged out.
        if indexPath.row == 8 {
            if Auth.auth().currentUser != nil {
                return UITableView.automaticDimension
            } else {
                return 0
            }
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "morePageCellID", for: indexPath)
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "main.Sign*Up".l10n()
            cell.imageView?.image = UIImage(systemName: "person.2.wave.2")
        } else if indexPath.row == 1 {
            cell.textLabel?.text = "main.Share".l10n()
            cell.imageView?.image = UIImage(systemName: "square.and.arrow.up")
        }  else if indexPath.row == 2 {
            cell.textLabel?.text = "main.How*it*Works?".l10n()
            cell.imageView?.image = UIImage(systemName: "questionmark.video")
        }  else if indexPath.row == 3 {
            cell.textLabel?.text = "main.Notifications".l10n()
            cell.imageView?.image = UIImage(systemName: "bell")
        } else if indexPath.row == 4 {
            cell.textLabel?.text = "main.Terms*of*Usage".l10n()
            cell.imageView?.image = UIImage(systemName: "character.book.closed")
        } else if indexPath.row == 5 {
            cell.textLabel?.text = "main.Help".l10n()
            cell.imageView?.image = UIImage(systemName: "hand.raised")
        } else if indexPath.row == 6 {
            cell.textLabel?.text = "main.Language".l10n()
            cell.imageView?.image = UIImage(systemName: "character.bubble")
        } else if indexPath.row == 7 {
            cell.textLabel?.text = "main.Log*Out".l10n()
            cell.imageView?.image = UIImage(systemName: "stop.circle")
        } else if indexPath.row == 8 {
            cell.textLabel?.text = "main.Delete*Account".l10n()
            cell.imageView?.image = UIImage(systemName: "trash")
        } /* else if indexPath.row == 9 {
            cell.textLabel?.text = "main.Buy*me*coffee".l10n()
        } */
        return cell
    }
}

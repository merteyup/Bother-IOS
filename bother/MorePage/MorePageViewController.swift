//
//  ProfilePageViewController.swift
//  bother
//
//  Created by Eyüp Mert on 17.07.2022.
//

import UIKit
import FirebaseAuth

class MorePageViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
                print("Signed Out")
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
                 let alertController = UIAlertController(title: "Are You Sure", message: "Do you want to log out?", preferredStyle: .alert)

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
            
        } else if indexPath.row == 2 {
            
        } else if indexPath.row == 3 {
            
        } else if indexPath.row == 4 {
            
        } else if indexPath.row == 5 {
            
        } else if indexPath.row == 6 {
            
            openSelectLanguageViewController()
            
        } else if indexPath.row == 7 {
            
            showAlertView()
            
        } else if indexPath.row == 8 {
            
        }/* else if indexPath.row == 9 {
          //  openBuyMeCoffeePage()
        }
        */
        
        
        
        print("Selected Row \(indexPath.row)")
    }
    
}

extension MorePageViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "morePageCellID", for: indexPath)
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "main.Sign*Up".l10n()
        } else if indexPath.row == 1 {
            cell.textLabel?.text = "main.Premium".l10n()
        } else if indexPath.row == 2 {
            cell.textLabel?.text = "main.How*it*Works?".l10n()
        }  else if indexPath.row == 3 {
            cell.textLabel?.text = "main.Notifications".l10n()
        } else if indexPath.row == 4 {
            cell.textLabel?.text = "main.Terms*of*Usage".l10n()
        } else if indexPath.row == 5 {
            cell.textLabel?.text = "main.Help".l10n()
        } else if indexPath.row == 6 {
            cell.textLabel?.text = "main.Language".l10n()
        } else if indexPath.row == 7 {
            cell.textLabel?.text = "main.Log*Out".l10n()
        } else if indexPath.row == 8 {
            cell.textLabel?.text = "main.Delete*Account".l10n()
        } /* else if indexPath.row == 9 {
            cell.textLabel?.text = "main.Buy*me*coffee".l10n()
        } */
        return cell
    }
}

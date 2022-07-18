//
//  ProfilePageViewController.swift
//  bother
//
//  Created by Eyüp Mert on 17.07.2022.
//

import UIKit

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
            
        } else if indexPath.row == 7 {
            
        } else if indexPath.row == 8 {
            
        }
        
        
        
        
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
            cell.textLabel?.text = "Sign Up"
        } else if indexPath.row == 1 {
            cell.textLabel?.text = "Premium"
        } else if indexPath.row == 2 {
            cell.textLabel?.text = "How it Works?"
        }  else if indexPath.row == 3 {
            cell.textLabel?.text = "Notifications"
        } else if indexPath.row == 4 {
            cell.textLabel?.text = "Terms of Usage"
        } else if indexPath.row == 5 {
            cell.textLabel?.text = "Help"
        } else if indexPath.row == 6 {
            cell.textLabel?.text = "Comment"
        } else if indexPath.row == 7 {
            cell.textLabel?.text = "Log Out"
        } else if indexPath.row == 8 {
            cell.textLabel?.text = "Delete Account"
        }
        return cell
    }
}

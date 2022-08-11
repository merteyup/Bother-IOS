//
//  SelectLanguageViewController.swift
//  bother
//
//  Created by Eyüp Mert on 20.07.2022.
//

import UIKit
import L10n_swift

class SelectLanguageViewController: UIViewController {

    
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    
    // MARK: - Statements
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func changeLanguageTo(newLanguage: String){
        L10n.shared.language = newLanguage;
        self.runAfterDelay(0.3) {
                DispatchQueue.main.async {
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
                    let vc = storyboard.instantiateViewController(withIdentifier: "MySubclassedTabBarControllerID") as! MySubclassedTabBarController;
                    
                    vc.modalPresentationCapturesStatusBarAppearance = true
                    vc.modalPresentationStyle = .overFullScreen;
                    self.present(vc, animated: false, completion: nil);
            }
        }
    }

}

extension SelectLanguageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languagesNames.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectLanguageViewControllerCellID", for: indexPath)
        
        cell.textLabel?.text = languagesNames[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newLanguage = languagesCodes[indexPath.row];

        print(newLanguage)
        L10n.shared.language = newLanguage
        changeLanguageTo(newLanguage: newLanguage)

    }
    
}

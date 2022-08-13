//
//  ViewController.swift
//  bother
//
//  Created by Eyüp Mert on 15.07.2022.
//

import UIKit
import FirebaseFunctions
import FirebaseAuth
import L10n_swift


class CategoryViewController: UIViewController {
    
    
    // MARK: - Variables
    lazy var functions = Functions.functions();

    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Statements
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: ADD DELETE STORY FUNCTION IN SECOND VERSION
        L10n.supportedLanguages
        L10n.preferredLanguage
        
        
        print("FuncWorked :\(L10n.supportedLanguages)")
        print("FuncWorked :\(L10n.preferredLanguage)")

     /*
      if let currentUser = Auth.auth().currentUser?.uid {
               var parameters = ["docId" : "5S9WoQYrvU3Lf9N0yEqf"]
               as [String : Any]
               functions.httpsCallable("deleteStoryCloud").call(parameters){ (result, error) in
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
      */
             
        
    }
    
    }

// MARK: - Extensions
extension CategoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openSelectedCategory(selectedMainCategory: indexPath.row)
    }
    
}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCellID", for: indexPath) as! CategoryTableViewCell
        cell.categoryTitle.text = categoryArray[indexPath.row]
        return cell
    }
    
}


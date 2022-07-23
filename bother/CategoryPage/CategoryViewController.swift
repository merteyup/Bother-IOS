//
//  ViewController.swift
//  bother
//
//  Created by Eyüp Mert on 15.07.2022.
//

import UIKit
import FirebaseFunctions
import FirebaseAuth

class CategoryViewController: UIViewController {
    
    // TODO: Work on main categories.
    
    // MARK: - Variables
    lazy var functions = Functions.functions();

    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Statements
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
             
     
        
   /*   if let currentUser = Auth.auth().currentUser?.uid {
            var parameters = ["firebaseUID" : currentUser,
                              "category" : 1,
                              "botherText": "Buraya dbye yazılacak bir text gireyim4.",
                              "title" : "Title yazıldı2"]
            as [String : Any]
            functions.httpsCallable("createStoryCloud").call(parameters){ (result, error) in
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
        
        /*
        
        if let currentUser = Auth.auth().currentUser?.uid {
            var parameters = ["firebaseUID" : currentUser] as [String : Any]
            functions.httpsCallable("getUserInfoCloud").call(parameters){ (result, error) in
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
        
        
        
  /*
        if let currentUser = Auth.auth().currentUser?.uid {
            
            var parameters =      ["firebaseUID" : currentUser,
                                   "appVersion": 1,
                                   "isVipMember" : false] as [String : Any]
            
            functions.httpsCallable("createUpdateUserProfileCloud").call(parameters){ (result, error) in
                if error == nil{
                    
                    //  print("FuncWorked :\(result?.data)")
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


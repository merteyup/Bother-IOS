//
//  ViewController.swift
//  bother
//
//  Created by Eyüp Mert on 15.07.2022.
//

import UIKit
import FCAlertView

class CategoryViewController: UIViewController {
    
    // TODO: Work on main categories.
    
    // MARK: - Variables
    var categoryArray : [String] = ["Technology",
                                    "Health",
                                    "Daily Life",
                                    "Hobbies",
                                    "Transportation",
                                    "Restaurants & Cafes",
                                    "Business Life",
                                    "Relationships",
                                    "Random"]

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    
    // MARK: - Statements
    override func viewDidLoad() {
        super.viewDidLoad()
        


        }
    }

// MARK: - Extensions
extension CategoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openSelectedCategory(categoryId: indexPath.row)
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


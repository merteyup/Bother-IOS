//
//  WriteOwnStoryViewController.swift
//  bother
//
//  Created by Eyüp Mert on 17.07.2022.
//

import UIKit



class WriteOwnStoryViewController: UIViewController {
    
    
    // MARK: - Variables
    

    // MARK: - Outlets
    @IBOutlet weak var headerOwnStory: UILabel!
    
    @IBOutlet weak var txtYourOwnStory: UITextView!
    
  
    @IBAction func btnSaveOwnStory(_ sender: Any) {
        
        dismiss(animated: true) {
            if self.txtYourOwnStory.text != "" {
                UserDefaults.standard.set(self.txtYourOwnStory.text, forKey: "currentStory")
            }
            botherArray = loremIpsum.components(separatedBy: ["!", ".", "?"])

        }
        
        
    }
    
    // MARK: - Actions
    
    // MARK: - Statements
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    


}

extension WriteOwnStoryViewController: UITextViewDelegate {
    
    
}

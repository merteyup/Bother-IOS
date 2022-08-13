//
//  TermsOfUsageViewController.swift
//  bother
//
//  Created by Eyüp Mert on 13.08.2022.
//

import UIKit

class TermsOfUsageViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var lblTermsOfUsage: UITextView!
    
    // MARK: - Actions
    @IBAction func actionDismiss(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    // MARK: - Statements
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTermsOfUsage.text = termsOfUsage
    }
    
}
